/// @description Create particles and grave

//Create particles

//Create grave	
if (grave)
{
	var graveX, graveY;
	
	graveX = (x div 16) * 16;
	graveY = (y div 16) * 16;
	
	//Don't create if a solid or grave spawner is already here
	if (!position_meeting(graveX, graveY, parSolid) && !position_meeting(graveX, graveY, objGraveSpawner))
	{
		instance_create_layer(graveX, graveY, "Objects", objGraveSpawner);
	}
}