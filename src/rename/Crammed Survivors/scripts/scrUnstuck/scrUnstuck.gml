//This script involves unstucking the player object.

/// @function unstuckPlayer(entityId)
/// @description Unstucks the player if they are in a wall.
/// @param {Real} entityId The ID of the game object to unstuck.
function unstuckPlayer(entityId)
{
	with (entityId)
	{
		var wall;
		var freeSpot;
		var bboxW, bboxH;
		
		//Stuck?
		if (place_meeting(x, y, parSolid))
		{
			wall = instance_place(x, y, parSolid);
			
			//Unstuck
			freeSpot = findClosestFreeSpot((wall.x div 16) * 16, (wall.y div 16) * 16);
			
			if (freeSpot == noone)
			{
				show_debug_message("Couldn't unstuck game object! Great!");
				
				return;
			}
			
			bboxW = bbox_right - 1 - bbox_left;
			bboxH = bbox_bottom - 1 - bbox_top;
			
			x = freeSpot.x + bboxW / 2;
			y = freeSpot.y + bboxH / 2;
		}
	}
}

/// @function findClosestFreeSpot(x, y)
/// @descriptions Searchs for the closest free tile from the given tile position.
/// @param {Real} x The x position to check from.
/// @param {Real} y The y position to check from.
/// @return {Struct} Returns a {x, y} struct of a free position. Otherwise returns noone
function findClosestFreeSpot(x, y)
{
	//Free spot found?
	if (spotFree(x, y))
	{
		return {x: x, y: y};
	}
	
	var neighbors = [
			{x: x, y: y + 16},
            {x: x, y: y - 16},
            {x: x - 16, y: y},
            {x: x + 16, y: y},
            {x: x - 16, y: y + 16},
            {x: x + 16, y: y + 16},
			{x: x - 16, y: y - 16},
			{x: x + 16, y: y - 16}
        ];
	
	//Check each neighbor
	for (var i = 0; i < 8; i++)
	{
		var freeSpot = findClosestFreeSpot(neighbors[i].x, neighbors[i].y);
		
		//Free spot found?
		if (freeSpot != noone)
		{
			return freeSpot;	
		}
	}
	
	return noone;
}

/// @function spotFree(x, y)
/// @description Checks if the spot is free for the player to go to.
/// @param {Real} x X position to check
/// @param {Real} y Y position to check
/// @return {Bool} Returns true if the given spot is free. Checks for solid and makes sure the player will be in the border.
function spotFree(x, y)
{
	var bboxW, bboxH;
	
	bboxW = bbox_right - 1 - bbox_left;
	bboxH = bbox_bottom - 1 - bbox_top;
	
	//Meeting solid
	if (place_meeting(x + bboxW / 2, y + bboxH / 2, parSolid))
	{
		return false;	
	}
	
	//Not in border
	if (x < objBorder.x + bboxW / 2 || x > objBorder.x + objBorder.width - bboxW / 2 || 
		y < objBorder.y + bboxH / 2 || y > objBorder.y + objBorder.height - bboxH / 2)
	{
		return false;	
	}
	
	return true;
}