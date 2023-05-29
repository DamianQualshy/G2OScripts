local allowed_keys = array(255, false);
	allowed_keys[KEY_ESCAPE] = true;
	allowed_keys[MOUSE_LMB] = true;

local clicks = 0;
local clicks_draw = Draw(5200, 7500, "Clicks: 0");
local leaderboard = [
	Draw(0, 500, "name clicks time"),
	Draw(0, 1000, "name clicks time"),
	Draw(0, 1500, "name clicks time"),
	Draw(0, 2000, "name clicks time"),
	Draw(0, 2500, "name clicks time"),
	Draw(0, 3000, "name clicks time"),
	Draw(0, 3500, "name clicks time"),
	Draw(0, 4000, "name clicks time"),
	Draw(0, 4500, "name clicks time"),
	Draw(0, 5000, "name clicks time")
	];

addEventHandler("onInit", function(){
	clearMultiplayerMessages();
	setKeyLayout(1);

	setFreeze(true);

		clicks_draw.visible = true;
	for(local i = 0, end = leaderboard_shared.len(); i < end && i < 10; ++i){
		leaderboard[i].text = format("%d: %s %d %g", i, leaderboard_shared[i][0], leaderboard_shared[i][1], leaderboard_shared[i][2]);
		leaderboard[i].visible = true;
		print(leaderboard[i].text);
	}
});

addEventHandler("onExit", function(){
		clicks_draw.visible = false;
	for(local i = 0, end = leaderboard.len(); i < end; ++i){
		leaderboard[i].visible = false;
	}
});

addEventHandler("onPacket", function(packet){
	local packetId = packet.readUInt8();
	if(packetId == packets.leaderboard_update){
		for(local i = 0, end = leaderboard_shared.len(); i < end && i < 10; ++i){
			leaderboard[i].text = format("%d: %s %d %g", i, leaderboard_shared[i][0], leaderboard_shared[i][1], leaderboard_shared[i][2]);
		}
	}
});

addEventHandler("onKey", function(key){
	if(!allowed_keys[key]){
		cancelEvent();
	}
	if(key == KEY_ESCAPE){
		exitGame();
	}
});

addEventHandler("onMouseRelease", function(button){
	if(!allowed_keys[button]){
		cancelEvent();
	}
	if(button == MOUSE_LMB){
		local packet = Packet();
			packet.writeUInt8(packets.click);
			packet.send(RELIABLE);

		++clicks;
		clicks_draw.text = format("Clicks: %d", clicks);
	}
});