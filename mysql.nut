class MySql {
	// ----------------------
	static handler = null;

	// ----------------------
	static function Init(host, login, password, db) {
		handler <- mysql_connect(host, login, password, db);

		if(handler) print("Logged into MySql");
		else print("Cannot login into MySql");
	}

	static function Deinit() {
		if(handler)
			mysql_close(handler);
	}

	// ----------------------
	static function query(text) {
		if(handler) {
			local result = mysql_query(handler, text);
			if(result) 
				mysql_free_result(result);
			else 
				print("(MySql) " + mysql_error(handler) + " (ID: " + mysql_errno(handler) + ")");
		}
	}

	static function fetch(text) {
		if(handler) {
			local result = mysql_query(handler, text);
			if(result) {
				local arr = [];

				local row = mysql_fetch_assoc(result);
				while(row != null) {
					arr.push(row);
					row = mysql_fetch_assoc(result);
				}
				return arr;
			}
			else print("(MySql) " + mysql_error(handler) + " (ID: " + mysql_errno(handler) + ")");
		}
		return null;
	}
}

// ------------------------
addEventHandler("onInit", function(){
	MySql.Init(database.host, database.user, database.pass, database.db);
	MySql.query("SET FOREIGN_KEY_CHECKS=0");
});

addEventHandler("onExit", function(){
	MySql.query("SET FOREIGN_KEY_CHECKS=1");
	setTimer(function(){
		MySql.Deinit();
	}, 500, 0);
});