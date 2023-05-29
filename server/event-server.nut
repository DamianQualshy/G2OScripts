addEventHandler("onInit", function(){
	logEvent("server", "onInit", "Server Initialized");

	logEvent("server", "getHostname", "getHostname : " + getHostname());
	logEvent("server", "getMaxSlots", "getMaxSlots : " + getMaxSlots());
	logEvent("server", "getPlayersCount", "getPlayersCount : " + getPlayersCount());

	logEvent("server", "getStackTop", "getStackTop : " + getStackTop());
	logEvent("server", "getTickCount", "getTickCount : " + getTickCount());
});

addEventHandler("onExit", function(){
	logEvent("server", "onExit", "Server Closed");

	logEvent("server", "getHostname", "getHostname : " + getHostname());
	logEvent("server", "getMaxSlots", "getMaxSlots : " + getMaxSlots());
	logEvent("server", "getPlayersCount", "getPlayersCount : " + getPlayersCount());

	logEvent("server", "getStackTop", "getStackTop : " + getStackTop());
	logEvent("server", "getTickCount", "getTickCount : " + getTickCount());
});

addEventHandler("onTick", function(){
	logEvent("server", "onTick", "Tick");
});

addEventHandler("onPacket", function(pid, packet){
	logEvent("server", "onPacket", "player id : " + pid + " | packet : " + packet);
});

addEventHandler("onPlayerChangeColor", function(pid, r, g, b){
	logEvent("server", "onPlayerChangeColor", "player id : " + pid + " | r : " + r + " | g : " + g + " | b : " + b);
});

addEventHandler("onPlayerChangeFocus", function(pid, ofid, nfid){
	logEvent("server", "onPlayerChangeFocus", "player id : " + pid + " | old focus id : " + ofid + " | new focus id : " + nfid);
});

addEventHandler("onPlayerChangeHealth", function(pid, ohp, nhp){
	logEvent("server", "onPlayerChangeHealth", "player id : " + pid + " | old health : " + ohp + " | new health : " + nhp);
});

addEventHandler("onPlayerChangeMaxHealth", function(pid, ohp, nhp){
	logEvent("server", "onPlayerChangeMaxHealth", "player id : " + pid + " | old max health : " + ohp + " | new max health : " + nhp);
});

addEventHandler("onPlayerChangeMana", function(pid, omp, nmp){
	logEvent("server", "onPlayerChangeMana", "player id : " + pid + " | old mana : " + omp + " | new mana : " + nmp);
});

addEventHandler("onPlayerChangeMaxMana", function(pid, omp, nmp){
	logEvent("server", "onPlayerChangeMaxMana", "player id : " + pid + " | old max mana : " + omp + " | new max mana : " + nmp);
});

addEventHandler("onPlayerChangeWeaponMode", function(pid, owm, nwm){
	logEvent("server", "onPlayerChangeWeaponMode", "player id : " + pid + " | old weapon mode : " + owm + " | new weapon mode : " + nwm);
});

addEventHandler("onPlayerChangeWorld", function(pid, world){
	logEvent("server", "onPlayerChangeWorld", "player id : " + pid + " | world : " + world);
});

addEventHandler("onPlayerCommand", function(pid, cmd, par){
	logEvent("server", "onPlayerCommand", "player id : " + pid + " | command : " + cmd + " | params : " + par);
});

addEventHandler("onPlayerMessage", function(pid, msg){
	logEvent("server", "onPlayerMessage", "player id : " + pid + " | message : " + msg);
});

addEventHandler("onPlayerDead", function(pid, kid){
	logEvent("server", "onPlayerDead", "player id : " + pid + " | killer id : " + kid);
});