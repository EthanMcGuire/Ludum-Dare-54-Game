/// @description Draw timer

if (alarm[1] == -1 && delay > 0 && day)
{
	var text;
	
	if (delay > 120)
	{
		text = "3";
	}
	else if (delay > 60)
	{
		text = "2";	
	}
	else
	{
		text = "1";	
	}
	
	draw_set_font(fntTimer);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	drawTextOutline(camera_get_view_width(view_camera[0]) / 2, 24, text, c_yellow, c_red);
}