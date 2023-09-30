/// @description Variables and functions

global.gamePaused = false;

timeDelay = 180;	//Delay in frames before changing the time
delay = timeDelay;

enemyCount = 3;
enemyCountIncrease = 3;

day = true;

//Create the game objects
instance_create_layer(0, 0, "Main", objCamera);
instance_create_layer(0, 0, "Main", objEnemySpawner);
instance_create_layer(room_width / 2, room_height / 2, "Objects", objPlayer);

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

