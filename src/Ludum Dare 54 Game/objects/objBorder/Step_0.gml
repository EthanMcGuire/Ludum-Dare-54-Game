/// @description Change border size

if (instance_exists(objPauseMenu))
{
	return;	
}

if (sizeX != goalX || sizeY != goalY)
{
	//X size
	if (sizeX != goalX)
	{
		if (goalX > sizeX)
		{
			sizeX = min(sizeX + sizeChange, goalX);	
		}
		else
		{
			sizeX = max(sizeX - sizeChange, goalX);	
		}
	}


	//Y size
	if (sizeY != goalY)
	{
		if (goalY > sizeY)
		{
			sizeY = min(sizeY + sizeChange, goalY);	
		}
		else
		{
			sizeY = max(sizeY - sizeChange, goalY);	
		}
	}
	
	setSize(sizeX, sizeY);
}