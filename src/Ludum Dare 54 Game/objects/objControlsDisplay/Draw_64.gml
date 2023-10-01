/// @description Draw controls

var drawX, drawY, drawAlpha;

drawX = objPlayer.x - camera_get_view_x(view_camera[0]);
drawY = objPlayer.y - camera_get_view_y(view_camera[0]);
drawAlpha = 1;

if (alarm[0] <= 60)
{
	drawAlpha = alarm[0] / 60;	
}

//WASD
draw_sprite_ext(sprControlDisplay, 0, drawX, drawY, 1, 1, 0, c_white, drawAlpha);

//Press shoot!
draw_set_font(fntSmall);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_alpha(drawAlpha);

drawTextOutline(mouse_x, mouse_y - 32, "Press Left Mouse!", c_white, c_red);

draw_set_alpha(1);