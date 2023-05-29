addEventHandler("onInit", function(){
	logEvent("client", "onInit", "Client Initialized");

	logEvent("client", "getHostname", "getHostname : " + getHostname());
	logEvent("client", "getMaxSlots", "getMaxSlots : " + getMaxSlots());
	logEvent("client", "getPlayersCount", "getPlayersCount : " + getPlayersCount());

	logEvent("client", "getStackTop", "getStackTop : " + getStackTop());
	logEvent("client", "getTickCount", "getTickCount : " + getTickCount());
});

addEventHandler("onExit", function(){
	logEvent("client", "onExit", "Client Closed");

	logEvent("client", "getHostname", "getHostname : " + getHostname());
	logEvent("client", "getMaxSlots", "getMaxSlots : " + getMaxSlots());
	logEvent("client", "getPlayersCount", "getPlayersCount : " + getPlayersCount());

	logEvent("client", "getStackTop", "getStackTop : " + getStackTop());
	logEvent("client", "getTickCount", "getTickCount : " + getTickCount());
});