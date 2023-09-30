/// @description Variables and functions

day = true;

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