/// @description Draw upgrade box

var drawX, drawY;

draw_set_font(fntGame);

drawX = x - camera_get_view_x(view_camera[0]);
drawY = y - camera_get_view_y(view_camera[0]);

//Draw upgrade box
draw_sprite_ext(sprUpgradeBox, 0, drawX - width / 2, drawY - height / 2, width / sprite_get_width(sprUpgradeBox), height / sprite_get_height(sprUpgradeBox), 0, c_white, 1);

if (!destroy && !expand)
{
	//Upgrade art
	draw_sprite(sprUpgradeArt, upgradeIndex, drawX - 40, drawY - height / 2 + 8);
	
	//Upgrade text
	draw_set_color(c_red);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	draw_text_ext(drawX, drawY - height / 2 + 56, upgradeTitle, 16, width - 9);
	
	draw_set_font(fntSmall);
	draw_set_color(c_black);
	draw_text_ext(drawX, drawY - height / 2 + 72, upgradeText, 14, width - 9);
	
	//Draw upgrade button
	draw_sprite(sprUpgradeButton, 0, drawX, drawY + height / 2 - 24);

	if (selected)
	{
		draw_set_color(c_red);	
	}
	else
	{
		draw_set_color(c_white);	
	}

	draw_set_valign(fa_center);

	draw_text(drawX, drawY + height / 2 - 24, "GET");

	draw_set_color(c_white);	
}