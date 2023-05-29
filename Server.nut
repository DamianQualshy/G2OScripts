local Player = {};

for(local i = 0, end = getMaxSlots(); i < end; ++i){
	Player[i] <- {};

	Player[i].clicks <- 0;
	Player[i].timeonline <- 0;
	Player[i].timejoin <- 0;
	Player[i].timeleave <- 0;
}

function clearPlayer(pid){
	Player[pid].clicks = 0;
	Player[pid].timeonline = 0;
	Player[pid].timejoin = 0;
	Player[pid].timeleave = 0;
}

addEventHandler("onInit", function(){
	updateLeaderboard();

	setTimer(function(){
		updateLeaderboard();
	}, 30000, 0);
});

addEventHandler("onExit", function(){
	updateLeaderboard();
});

addEventHandler("onPacket", function(pid, packet){
	local packetId = packet.readUInt8();
	if(packetId == packets.click){
		++Player[pid].clicks;
	}
});

addEventHandler("onPlayerJoin", function(pid){
	if(getPlayerName(pid) == "Nickname"){
		kick(pid, "Zmieñ nick w launcherze Gothic 2 Online!");
	}

	Player[pid].timejoin = time();

	saveLog("players/" + getPlayerName(pid) + ".txt", getPlayerMacAddr(pid) + " / " + getPlayerSerial(pid) + " / " + getPlayerIP(pid));
});

addEventHandler("onPlayerDisconnect", function(pid, reason){
	updateLeaderboard();

	clearPlayer(pid);
});

function updateLeaderboard(){
	for(local i = 0, end = getMaxSlots(); i < end; ++i){
		updateScore(i);

	local packet = Packet();
		packet.writeUInt8(packets.leaderboard_update);
		packet.send(i, RELIABLE);
	}
		MySql.query("SELECT * FROM leaderboard ORDER BY clicks DESC");
			local result = MySql.fetch("SELECT * FROM leaderboard");
			for(local i = 0, end = result.len(); i < end && i < 10; ++i){
				leaderboard_shared[i] <- [result[i].rawget("name"), result[i].rawget("clicks"), result[i].rawget("online_time")];
				print(leaderboard_shared[i][0] + " " + leaderboard_shared[i][1] + " " + leaderboard_shared[i][2]);
			}
}

function updateScore(id){
	Player[id].timeleave = time();
	Player[id].timeonline = (Player[id].timeleave - Player[id].timejoin);

	local result = MySql.fetch("SELECT * FROM leaderboard WHERE name = '" + getPlayerName(id) + "'");
		if(result != null && result.len() > 0){
			local result_clicks = MySql.fetch("SELECT clicks, online_time FROM leaderboard WHERE name = '" + getPlayerName(id) + "'");
			if(result_clicks[0].rawget("clicks").tointeger() < Player[id].clicks){
				MySql.query("UPDATE leaderboard SET clicks = '" + Player[id].clicks + "', online_time = '" + Player[id].timeonline + "'");
			}
		} else MySql.query("INSERT INTO leaderboard (`name`, `clicks`, `online_time`) VALUES ('" + getPlayerName(id) + "', '" + Player[id].clicks + "', '" + Player[id].timeonline + "')");
}