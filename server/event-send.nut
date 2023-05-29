io <- {}

enum io_type
{
	LINE,
	ALL
}

class io.file extends file
{
	constructor(fileName, mode)
	{
		errorMsg = null

		try
		{
			base.constructor(fileName, mode)
			isOpen = true
		}
		catch (msg)
		{
			errorMsg = msg
			isOpen = false
		}
	}

	function write(text)
	{
		foreach (char in text)
		{
			writen(char, 'b')
		}
	}

	function read(type = io_type.ALL)
	{
		if (type == io_type.LINE)
		{
			local line = ""
			local char

			while (!eos() && (char = readn('b')))
			{
				if (char != '\n')
					line += char.tochar()
				else
					return line
			}

			return line.len() == 0 ? null : line
		}
		else if (type == io_type.ALL)
		{
			local content = ""
			local char

			while (!eos() && (char = readn('b')))
			{
				content += char.tochar()
			}

			return content.len() == 0 ? null : content
		}

		return null
	}

	function close()
	{
		base.close()
		isOpen = false
	}

	errorMsg = null
	isOpen = false
}

local packet = Packet();
local client_event = "";
local client_datas = "";
local client_params = "";

addEventHandler("onPacket", function(pid, packet){
	local packetId = packet.readString();

	if(packetId == "client"){
		client_event = packet.readString();
		client_datas = packet.readString();
		client_params = packet.readString();
			logEvent(packetId, client_event, client_params);
	}
}, priority = 1);

function logEvent(side, eventfunc, params){
	if(side == "server"){
		local myfile = io.file("event-log/server/" + eventfunc + ".log", "a+");
		if(myfile.isOpen){
				local datas = format("%02d/%02d/%04d", date().day, date().month + 1, date().year) + " " + format("%02d:%02d:%02d", date().hour, date().min, date().sec) + " " + format("%02d:%02d", getTime().hour, getTime().min);
			myfile.write(datas + " || " + params + " \n");
			myfile.close();
		} else print(myfile.errorMsg);
	}
	else if(side == "client"){
		local myfile = io.file("event-log/client/" + eventfunc + ".log", "a+");
		if(myfile.isOpen){
				local datas = client_datas + " " + format("%02d:%02d", getTime().hour, getTime().min);
			myfile.write(datas + " || " + params + " \n");
			myfile.close();
		} else print(myfile.errorMsg);
	}

	print(side + " " + eventfunc + " " + params);
}