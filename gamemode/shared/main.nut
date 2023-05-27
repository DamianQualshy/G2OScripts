Spawn <- [
	{
		world = "NEWWORLD\\NEWWORLD.ZEN",
		pos = [
			{x = -9544.21, y = 470.47, z = -12512.80, a = 0.0},
			{x = -9234.11, y = -96.18, z = -15098.72, a = 0.0},
			{x = -10682.80, y = -62.97, z = -14164.49, a = 0.0},
			{x = -9640.89, y = 408.04, z = -16082.80, a = 0.0},
			{x = -10123.79, y = 995.97, z = -18519.23, a = 0.0}
		],
		centre = {x = 0, y = 0, z = 0},
		func = function(id){
			spawnPlayer(id);
			setPlayerMaxHealth(id, 100);
			setPlayerHealth(id, 100);
			setPlayerStrength(id, 200);
			setPlayerDexterity(id, 200);
			setPlayerSkillWeapon(id, WEAPON_1H, 100);
			setPlayerSkillWeapon(id, WEAPON_2H, 100);
			setPlayerSkillWeapon(id, WEAPON_BOW, 100);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 100);

			equipItem(id, Items.id("ITMW_1H_BLESSED_03"));
			equipItem(id, Items.id("ITAR_SLD_H"));

			giveItem(id, Items.id("ITMW_2H_BLESSED_02"), 1);
			giveItem(id, Items.id("ITPO_HEALTH_ADDON_04"), 100);
		}
	},
	{
		world = "OLDWORLD\\OLDWORLD.ZEN",
		pos = [
			{x = 25642.47, y = 9523.15, z = -41642.43, a = 0.0},
			{x = 24776.37, y = 9523.15, z = -43162.73, a = 0.0},
			{x = 23465.60, y = 9563.15, z = -43256.23, a = 0.0},
			{x = 22741.86, y = 9605.15, z = -42038.84, a = 0.0},
			{x = 23030.36, y = 9652.15, z = -40575.76, a = 0.0}
		],
		centre = {x = 0, y = 0, z = 0},
		func = function(id){
			spawnPlayer(id);
			setPlayerMaxHealth(id, 100);
			setPlayerHealth(id, 100);
			setPlayerStrength(id, 200);
			setPlayerDexterity(id, 200);
			setPlayerSkillWeapon(id, WEAPON_1H, 100);
			setPlayerSkillWeapon(id, WEAPON_2H, 100);
			setPlayerSkillWeapon(id, WEAPON_BOW, 100);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 100);

			equipItem(id, Items.id("ITMW_ORKSCHLAECHTER"));
			equipItem(id, Items.id("ITAR_THORUS_ADDON"));

			giveItem(id, Items.id("ITMW_DRACHENSCHNEIDE"), 1);
			giveItem(id, Items.id("ITPO_HEALTH_ADDON_04"), 100);
		}
	},
	{
		world = "ADDON\\ADDONWORLD.ZEN",
		pos = [
			{x = 25390.84, y = -4007.95, z = 29934.01, a = 0.0},
			{x = 24640.08, y = -4008.00, z = 31887.26, a = 0.0},
			{x = 26227.96, y = -4007.95, z = 31763.97, a = 0.0},
			{x = 26236.42, y = -4008.08, z = 30167.32, a = 0.0},
			{x = 24705.58, y = -4008.01, z = 30108.51, a = 0.0}
		],
		centre = {x = 0, y = 0, z = 0},
		func = function(id){
			spawnPlayer(id);
			setPlayerMaxHealth(id, 100);
			setPlayerHealth(id, 100);
			setPlayerStrength(id, 200);
			setPlayerDexterity(id, 200);
			setPlayerSkillWeapon(id, WEAPON_1H, 100);
			setPlayerSkillWeapon(id, WEAPON_2H, 100);
			setPlayerSkillWeapon(id, WEAPON_BOW, 100);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 100);

			equipItem(id, Items.id("ITMW_ELBASTARDO"));
			equipItem(id, Items.id("ITAR_RAVEN_ADDON"));

			giveItem(id, Items.id("ITMW_ZWEIHAENDER3"), 1);
			giveItem(id, Items.id("ITPO_HEALTH_ADDON_04"), 100);
		}
	},
	{
		world = "NEWWORLD\\DRAGONISLAND.ZEN",
		pos = [
			{x = -16193.00, y = 2214.15, z = 2808.00, a = 0.0},
			{x = -16105.21, y = 2214.15, z = 25264.02, a = 0.0},
			{x = -18915.71, y = 2214.19, z = 25178.97, a = 0.0},
			{x = -18824.53, y = 2214.17, z = 28314.36, a = 0.0},
			{x = -17451.64, y = 2214.14, z = 23662.87, a = 0.0}
		],
		centre = {x = 0, y = 0, z = 0},
		func = function(id){
			spawnPlayer(id);
			setPlayerMaxHealth(id, 100);
			setPlayerHealth(id, 100);
			setPlayerStrength(id, 200);
			setPlayerDexterity(id, 200);
			setPlayerSkillWeapon(id, WEAPON_1H, 100);
			setPlayerSkillWeapon(id, WEAPON_2H, 100);
			setPlayerSkillWeapon(id, WEAPON_BOW, 100);
			setPlayerSkillWeapon(id, WEAPON_CBOW, 100);

			equipItem(id, Items.id("ITMW_1H_SPECIAL_04"));
			equipItem(id, Items.id("ITAR_PAL_H"));

			giveItem(id, Items.id("ITMW_2H_SPECIAL_04"), 1);
			giveItem(id, Items.id("ITPO_HEALTH_ADDON_04"), 100);
		}
	}
];