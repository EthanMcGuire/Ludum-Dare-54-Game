/// @description Wait till walls are placed

if (instance_exists(objPauseMenu))
{
	return;	
}

//Current wall done being placed?
if (!wall.beingPlaced)
{
	wallsLeft--;
	
	//Done?
	if (wallsLeft == 0)
	{
		instance_destroy();
	}
	else
	{
		//Get next wall
		getWall();	
	}
}