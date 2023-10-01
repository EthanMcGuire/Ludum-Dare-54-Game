/// @description Get placed

if (gamePaused())
{
	return;	
}

if (beingPlaced)
{
	x = (mouse_x div 16) * 16;
	y = (mouse_y div 16) * 16;
	
	//Can be placed?
	if (place_meeting(x, y, parSolid) || place_meeting(x, y, objPlayer) || 
		x < objBorder.x || x + sprite_width > objBorder.x + objBorder.width || 
		y < objBorder.y || y + sprite_height > objBorder.y + objBorder.height)
	{
		canBePlaced = false;
	}
	else
	{
		canBePlaced = true;
		
		//Place
		if (mouse_check_button_pressed(mb_left))
		{
			beingPlaced = false;
			collisionsEnabled = true;
		}
	}
}