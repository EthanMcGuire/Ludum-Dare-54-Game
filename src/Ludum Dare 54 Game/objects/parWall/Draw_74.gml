/// @description Draw placement

if (beingPlaced)
{
	var color;
	
	if (canBePlaced)
	{
		color = c_yellow;	
	}
	else
	{
		color = c_red;	
	}
	
	draw_sprite_ext(sprite_index, 0, x - camera_get_view_x(view_camera[0]), y - camera_get_view_y(view_camera[0]), 1, 1, 0, color, 1);	
}