/// @description Draw placement

if (beingPlaced)
{
	var color;
	
	if (canBePlaced)
	{
		color = c_green;	
	}
	else
	{
		color = c_red;	
	}
	
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, color, 1);	
}