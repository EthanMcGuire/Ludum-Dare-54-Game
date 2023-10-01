/// @description Variables

wall = noone;
wallsLeft = 5;

/// @function getWall();
/// @description Gets the next wall to place.
getWall = function()
{
	//Cover wall?
	if (random(1) <= objGameController.coverWallChance)
	{
		wall = instance_create_layer(mouse_x, mouse_y, "Objects", objWall2);
	}
	else
	{
		wall = instance_create_layer(mouse_x, mouse_y, "Objects", objWall);	
	}
}

getWall();