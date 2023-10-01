/// @description Variables and functions

points = 0;
pointMultiplier = 1;
coverWallChance = 0;

timeDelay = 180;	//Delay in frames before changing the time
upgradeDelay = 60;
delay = timeDelay;

enemyCount = 3;
enemyCountIncrease = 3;

day = true;

alarm[1] = 60;

//Create the game objects
instance_create_layer(0, 0, "Main", objCamera);
instance_create_layer(0, 0, "Main", objEnemySpawner);
instance_create_layer(0, 0, "Main", objHud);
instance_create_layer(0, 0, "Border", objBorder);
instance_create_layer(room_width / 2, room_height / 2, "Objects", objPlayer);
instance_create_layer(0, 0, "Main", objControlsDisplay);

/// @function changeTime()
/// @description Changes the time from day to night and vice versa.
changeTime = function()
{
	var layerId;
	var tileId;
	
	day = !day;
	
	//Switch tiles
	layerId = layer_get_id("Tiles");
	tileId = layer_tilemap_get_id(layerId);
	
	if (day)
	{
		tilemap_tileset(tileId, tsDay);
		
		//Spawn graves
		with (objGraveSpawner)
		{
			spawnGrave();	
		}
	}
	else
	{
		tilemap_tileset(tileId, tsNight);
	}
	
	//Switch object sprites
	with (objPlayer)
	{
		switchSprite();	
	}
	
	with (parSolid)
	{
		switchSprite();	
	}
}

/// @function addPoints(amount)
/// @param {Real} amount Amount of points to add
addPoints = function(amount)
{
	points += amount * pointMultiplier;	
}
