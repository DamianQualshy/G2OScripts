local packet = Packet();

function logEvent(side, event, params){
	packet.reset();

	packet.writeString(side);
	packet.writeString(event);
	packet.writeString(format("%02d/%02d/%04d", date().day, date().month + 1, date().year) + " " + format("%02d:%02d:%02d", date().hour, date().min, date().sec));
	packet.writeString(params);
		packet.send(RELIABLE_ORDERED);
}