local matchConfig = {
	countdownTime = 1000,
	preroundTime = 10000,
	roundTime = 180000,
	bombTime = 30000,
	selectionPos = {x = 262.50103759766, y = 474.04739379883, z = -5298.1748046875},
	minPlayers = 2,
	minDifference = 2
}

local matchTimer = {
	preround = 0,
	round = 1,
	bomb = 2,
	defuse = 3,
	afterround = 4
};

local teamTT = packets.teamTT;
local teamCT = packets.teamCT;

local Classes = [
	{
		name = "Bandyta",
		team = teamTT,
		color = {r = 250, g = 100, b = 0},
		spawn = [
			{x = 863.97198486328, y = -96.835762023926, z = -1327.9030761719, a = 91.0},
			{x = 865.51055908203, y = -96.065582275391, z = -1489.8846435547, a = 91.0},
			{x = 867.04333496094, y = -97.8017578125, z = -1656.6732177734, a = 91.0},
			{x = 872.91729736328, y = -96.246421813965, z = -1836.5517578125, a = 91.0},
			{x = 874.76220703125, y = -94.650833129883, z = -1987.1541748047, a = 91.0},
			{x = 658.90832519531, y = -83.118881225586, z = -1148.4565429688, a = 88.0},
			{x = 641.15795898438, y = -88.030334472656, z = -1300.8188476563, a = 91.0},
			{x = 640.88098144531, y = -92.825546264648, z = -1470.9879150391, a = 91.0},
			{x = 675.22003173828, y = -95.16471862793, z = -1641.7072753906, a = 91.0},
			{x = 676.38861083984, y = -96.542655944824, z = -1774.2614746094, a = 91.0},
			{x = 675.45709228516, y = -97.697814941406, z = -1943.6342773438, a = 91.0},
			{x = 464.89633178711, y = -87.899147033691, z = -1243.5950927734, a = 86.0},
			{x = 475.24948120117, y = -88.057495117188, z = -1412.8336181641, a = 91.0},
			{x = 475.63134765625, y = -90.986671447754, z = -1581.2565917969, a = 91.0},
			{x = 472.3916015625, y = -100.23233032227, z = -1935.2331542969, a = 91.0},
			{x = 489.88391113281, y = -95.903770446777, z = -2102.5297851563, a = 91.0}
		],
		func = function(id){
			setPlayerMaxHealth(id, 100);
			setPlayerHealth(id, 100);
			setPlayerStrength(id, 100);
			setPlayerDexterity(id, 100);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 100);

			equipItem(id, Items.id("ITRW_MIL_CROSSBOW"));
			equipItem(id, Items.id("ITAR_BDT_H"));
			giveItem(id, Items.id("ITRW_BOLT"), 100);
		},
		visual = [
			{bodyT = 2, headM = "HUM_HEAD_THIEF", headT = 29},
			{bodyT = 3, headM = "HUM_HEAD_PSIONIC", headT = 130},
			{bodyT = 2, headM = "HUM_HEAD_PSIONIC", headT = 123},
			{bodyT = 3, headM = "HUM_HEAD_THIEF", headT = 132}
		]
	},
	{
		name = "Stra¿nik",
		team = teamCT,
		color = {r = 0, g = 100, b = 250},
		spawn = [
			{x = 9901.919921875, y = 368.25009155273, z = 4282.9262695313, a = 185.0},
			{x = 9710.767578125, y = 368.24349975586, z = 4295.5595703125, a = 185.0},
			{x = 9593.48828125, y = 368.25765991211, z = 4499.5747070313, a = 249.0},
			{x = 9519.2421875, y = 368.27764892578, z = 4685.009765625, a = 243.0},
			{x = 9425.7978515625, y = 368.26965332031, z = 4858.3286132813, a = 243.0},
			{x = 9357.08203125, y = 368.23477172852, z = 5070.3784179688, a = 242.0},
			{x = 9251.119140625, y = 368.57620239258, z = 5262.7763671875, a = 242.0},
			{x = 9819.814453125, y = 368.28561401367, z = 4687.4946289063, a = 246.0},
			{x = 9739.6181640625, y = 368.26950073242, z = 4858.6181640625, a = 246.0},
			{x = 9650.36328125, y = 368.26809692383, z = 5052.8041992188, a = 246.0},
			{x = 9547.19921875, y = 368.25881958008, z = 5277.5268554688, a = 246.0},
			{x = 9456.0263671875, y = 368.30850219727, z = 5466.25, a = 246.0},
			{x = 10056.544921875, y = 364.97082519531, z = 4551.33984375, a = 243.0},
			{x = 9972.0224609375, y = 367.59133911133, z = 4887.1953125, a = 243.0},
			{x = 9955.798828125, y = 367.89999389648, z = 5170.4072265625, a = 243.0},
			{x = 9721.9345703125, y = 370.23724365234, z = 5387.380859375, a = 243.0}
		],
		func = function(id){
			setPlayerMaxHealth(id, 100);
			setPlayerHealth(id, 100);
			setPlayerStrength(id, 100);
			setPlayerDexterity(id, 100);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 100);

			equipItem(id, Items.id("ITRW_MIL_CROSSBOW"));
			equipItem(id, Items.id("ITAR_MIL_M"));
			giveItem(id, Items.id("ITRW_BOLT"), 100);
		},
		visual = [
			{bodyT = 0, headM = "HUM_HEAD_BALD", headT = 47},
			{bodyT = 1, headM = "HUM_HEAD_PONY", headT = 105},
			{bodyT = 0, headM = "HUM_HEAD_PONY", headT = 44},
			{bodyT = 1, headM = "HUM_HEAD_BALD", headT = 62}
		]
	}
];


class Player {
	inGame = null;
	alive = null;
	spectator = null;
	team = null;

	constructor(id){
		inGame = false;
		alive = false;
		spectator = false;
		team = null;
	}
}

class Teams {
	playersTT = null;
	playersCT = null;

	pointsTT = null;
	pointsCT = null;

	function initTeams(){
		playersTT = 0;
		playersCT = 0;

		pointsTT = 0;
		pointsCT = 0;
	}
}

class Match {
	preround = null;
	preroundTime = null;
	roundTime = null;
	started = null;
	players = null;

	function initGame(){
		preround = false;
		preroundTime = matchConfig.preroundTime;
		roundTime = matchConfig.roundTime;
		started = false;
		players = 0;
	}
}

local team = Teams();


function initPlayers(){
	for(local i = 0, end = getMaxSlots(); i < end; ++i){
		Player[i] <- {};

		Player[i].inGame <- false;
		Player[i].alive <- false;
		Player[i].spectator <- false;
		Player[i].team <- null;
	}
}

function flushPlayer(pid){
	Player[pid].inGame = false;
	Player[pid].alive = false;
	Player[pid].spectator = false;
	Player[pid].team = null;
}


addEventHandler("onPacket", function(pid, packet){
	local packetId = packet.readUInt8();

	if(packetId == teamChoose_C){
		local team = packet.readUInt8();
			local diff = abs(Teams.playersCT - Teams.playersTT);
			if(diff > matchConfig.minDifference){
				if(Teams.playersCT > Teams.playersTT) {
					team = teamTT;
				} else if (Teams.playersTT > Teams.playersCT) {
					team = teamCT;
				}
			packet.writeUInt8(packets.autoBalance);
			packet.send(pid, RELIABLE);
			}
		teamChoose(pid, team);
	}

	if(packetId == bombPlanting){

	}

	if(packetId == bombPlanted){
		matchTimer.bomb = setTimer(function(){
			if(Match.started == true){

			}
		}, matchConfig.bombTime, 1);
	}

	if(packetId == bombDefusing){

	}

	if(packetId == bombDefused){

	}

	if(packetId == bombDetonated){

	}

});

addEventHandler("onInit", function(){
	print("-==================================-");
	print("[Counter-Strike: Squirrel Re-Make]");
	print("-==================================-");

	Match.initGame();
	initTeams();
	initPlayers();

	matchTimer.round = setTimer(function(){
		if(Match.started == true){
			for(local i = 0, end = getMaxSlots(); i < end; ++i){
				if(Player[i].inGame == true && Player[i].alive == true){
					autoBalance(i);
				}
			}
		}
	}, matchConfig.roundTime, 0);
});

addEventHandler("onPlayerJoin", function(pid){
	initRound(pid);
});

addEventHandler("onPlayerDisconnect", function(pid, reason){
	if(Player[pid].team != null){
		--Match.players;
	}
	flushPlayer(pid);
});

addEventHandler("onPlayerHit", function(pid, kid, dmg, dmgtype){
	if(Player[pid].spectator == true){
		cancelEvent();
	}

	eventValue(10);
});

addEventHandler("onPlayerDead", function(pid, kid){
	setPlayerSpectator(pid);
});

addEventHandler("onPlayerChangeWeaponMode", function(pid, oldwm, newwm){
	if(Player[pid].spectator == false){
		if(newwm != WEAPONMODE_CBOW){
			applyPlayerOverlay(pid, Mds.id("HUMANS_CBOWT2.MDS"));
			setPlayerWeaponMode(pid, WEAPONMODE_CBOW);
		}
	} else
		setPlayerWeaponMode(pid, WEAPONMODE_NONE);
});


function initRound(pid){
	local packet = Packet();

	if(Match.started != true){
		if(getPlayersCount() >= matchConfig.minPlayers){
			setPlayerPosition(pid, matchConfig.selectionPos.x, matchConfig.selectionPos.y, matchConfig.selectionPos.z);

			packet.writeUInt8(packets.teamChoose_S);
			packet.send(pid, RELIABLE);
		} else {
			packet.writeUInt8(packets.playerCount);
			packet.send(pid, RELIABLE);
		}
	} else {
		packet.writeUInt8(packets.matchStarted);
		packet.send(pid, RELIABLE);

		setPlayerSpectator(pid);
	}
}

function teamChoose(pid, team){
	if(team == teamTT){
		Player[pid].team = 1;
		++Teams.playersTT;
	} else if(team == teamCT){
		Player[pid].team = 2;
		++Teams.playersCT;
	}

			setPlayerTeam(pid, team);
		local spawn = rand() % Classes[option].spawn.len();
			setPlayerPosition(pid, Classes[option].spawn[spawn].x, Classes[option].spawn[spawn].y, Classes[option].spawn[spawn].z);
			setPlayerAngle(pid, Classes[option].spawn[spawn].a);

		startMatch(pid);
		++Match.players;
}

function startMatch(pid){
	local countdown = 0;
	if(Match.players >= matchConfig.minPlayers){
		matchTimer.preround = setTimer(function(){
			if(Match.players < matchConfig.minPlayers){
				killTimer(matchTimer.preround);
			} else {
				packet.writeUInt8(packets.countdown);
				packet.send(pid, RELIABLE);

				if(countdown >= 9){
					for(local i = 0, end = getMaxSlots(); i < end; ++i){
						if(Player[i].team != null){
							Player[i].inGame = true;
						}
					}
					Match.started = true;
						packet.writeUInt8(packets.roundStart);
						packet.send(pid, RELIABLE);
				} else ++countdown;
			}
		}, Match.countdownTime, 10);
	} else {
		packet.writeUInt8(packets.playerCount);
		packet.send(pid, RELIABLE);
	}
}

function autoBalance(pid){
	local team = null;
	local diff = abs(Teams.playersCT - Teams.playersTT);
	if(diff > matchConfig.minDifference){
		if(Teams.playersCT > Teams.playersTT) {
			team = teamTT;
		} else if (Teams.playersTT > Teams.playersCT) {
			team = teamCT;
		}
			while(diff > matchConfig.minDifference){
				local id = rand() % getPlayersCount();
					setPlayerTeam(id, team);

				print(diff);
			}
	}
}

function endRound(){

}

function setPlayerSpectator(pid){
	Player[pid].spectator = true;

	if(Player[pid].team != null){
		Player[pid].alive = false;
	}
}

function setPlayerTeam(pid, team){
	Player[pid].team = team;
	Classes[team].func(pid);

		local skin = rand() % Classes[team].visual.len();
			setPlayerVisual(pid, "HUM_BODY_NAKED0", Classes[team].visual[skin].bodyT, Classes[team].visual[skin].headM, Classes[team].visual[skin].headT);

		setPlayerColor(pid, Classes[team].color.r, Classes[team].color.g, Classes[team].color.b);
}