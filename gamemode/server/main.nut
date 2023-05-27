	local world = "";

	local coordinates = null;
	local spawn = null;
	local centrepos = null;

	local radius = null;
	local distance = null;

	local coordinates_x = 0;
	local coordinates_y = 0;
	local coordinates_z = 0;

addEventHandler("onInit", function(){
	setTimer(function(){
		areaManager();
	}, 1000, 0)

	for(local i = 0, end = Spawn.len(); i < end; ++i){
		coordinates = Spawn[i].pos;

		for(local v = 0, end = coordinates.len(); v < end; ++v){
			coordinates_x += coordinates[v].x;
			coordinates_y += coordinates[v].y;
			coordinates_z += coordinates[v].z;
		}

		Spawn[i].centre = {x = (coordinates_x/coordinates.len()), y = (coordinates_y/coordinates.len()), z = (coordinates_z/coordinates.len())};
	}
});

function playerSpawn(pid, world){
	setPlayerWorld(pid, world);

	for(local i = 0, end = Spawn.len(); i < end; ++i){
		if(world == Spawn[i].world){
			local position = Spawn[i].pos[rand() % 4];

			setPlayerPosition(pid, position.x, position.y, position.z);
			setPlayerAngle(pid, rand() % 360);
			Spawn[i].func(pid);
		}
	}
}

function areaManager(){
	for(local pid = 0, end = getMaxSlots(); pid < end; ++pid){
		if(!isPlayerConnected(pid)) continue;
		if(!isPlayerSpawned(pid)) continue;

		world = getPlayerWorld(pid);
		for(local wid = 0, end = Spawn.len(); wid < end; ++wid){
			if(world == Spawn[wid].world){
				centrepos = Spawn[wid].centre;
				spawn = Spawn[wid].pos[rand() % 4];
				playerAreaManager(pid);
			}
		}
	}
}

function playerAreaManager(pid){
	radius = getDistance3d(centrepos.x, centrepos.y, centrepos.z, centrepos.x + 3000, centrepos.y + 2000, centrepos.z + 3000);
		local player_pos = getPlayerPosition(pid);
	distance = getDistance3d(centrepos.x, centrepos.y, centrepos.z, player_pos.x, player_pos.y, player_pos.z);

	if(distance >= radius){
		setPlayerPosition(pid, spawn.x, spawn.y, spawn.z)
		sendMessageToPlayer(pid, 255, 128, 128, "Nie uciekaj poza arenê!");
	}
}

addEventHandler("onPlayerJoin", function(pid){
	if(getPlayerName(pid) == "Nickname"){
		kick(pid, "Zmieñ nick w launcherze Gothic 2 Online!");
	} else {
		for(local i = 0, end = getMaxSlots(); i < end; ++i){
			if(pid != i && getPlayerName(pid) == getPlayerName(i)){
				kick(pid, "Ten nick jest ju¿ zajêty!");
			}
		}

	sendMessageToAll(128, 255, 128, getPlayerName(pid) + " w³aœnie do³¹czy³ do gry!");
	sendMessageToPlayer(pid, 128, 255, 128, "Aby zmieniæ arenê, u¿yj komendy /map (1-4)!");

	for(local i = 0, end = Spawn.len(); i < end; ++i){
		if(getServerWorld() == Spawn[i].world){
			local position = Spawn[i].pos[rand() % 4];

			setPlayerPosition(pid, position.x, position.y, position.z);
			setPlayerAngle(pid, rand() % 360);
			Spawn[i].func(pid);
		}
	}

	}
});

addEventHandler("onPlayerHit", function(pid, kid, dmg, dmgtype){
	eventValue(5);
});

addEventHandler("onPlayerDead", function(pid, kid){
	sendMessageToAll(255, 128, 128, getPlayerName(kid) + " zabi³ " + getPlayerName(pid) + "!");
	setPlayerRespawnTime(pid, 2000);
});

addEventHandler("onPlayerMessage", function(pid, msg){
	sendMessageToAll(200, 200, 200, getPlayerName(pid) + ": " + msg);
});

addEventHandler("onPlayerCommand", function(pid, cmd, params){
	cmd = cmd.tolower();

	if(cmd == "map"){
		local world = params;
		if(params == "1"){world = "NEWWORLD\\NEWWORLD.ZEN"}
		if(params == "2"){world = "OLDWORLD\\OLDWORLD.ZEN"}
		if(params == "3"){world = "ADDON\\ADDONWORLD.ZEN"}
		if(params == "4"){world = "NEWWORLD\\DRAGONISLAND.ZEN"}

		playerSpawn(pid, world);
	}
});

addEventHandler("onPlayerRespawn", function(pid){
	for(local i = 0, end = Spawn.len(); i < end; ++i){
		if(getPlayerWorld(pid) == Spawn[i].world){
			local position = Spawn[i].pos[rand() % 4];

			setPlayerPosition(pid, position.x, position.y, position.z);
			setPlayerAngle(pid, rand() % 360);
			Spawn[i].func(pid);
		}
	}
});

addEventHandler("onPlayerChangeWeaponMode", function(pid, oldwm, newwm){
	if(newwm != WEAPONMODE_NONE){
		if(newwm == WEAPONMODE_1HS){
			applyPlayerOverlay(pid, Mds.id("HUMANS_1HST2.MDS"));
		}
		if(newwm == WEAPONMODE_2HS){
			applyPlayerOverlay(pid, Mds.id("HUMANS_2HST2.MDS"));
		}
	}
});