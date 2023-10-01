/// @description Draw pause menu

var drawX, drawY;

//Menu box
drawX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
drawY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;

drawY -= height / 2;

draw_sprite_ext(sprMenuBox, 0, drawX - width / 2, drawY, width / sprite_get_width(sprMenuBox), height / sprite_get_height(sprMenuBox), 0, c_white, 1);

//Options
draw_set_font(fntGui);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_set_color(c_black);

drawY += textYOffset;

for (var i = 0; i < optionCount; i++)
{
	//Highlight if selected
	if (optionSelected == i)
	{
		draw_set_color(c_red);
	}
	else
	{
		draw_set_color(c_black);
	}
	
	draw_text(drawX, drawY, options[i]);
	
	drawY += textSep;
	
	draw_set_color(c_black);
}

draw_set_color(c_white);