/// @description Draw game over text

var drawX, drawY;
var width, height;

drawX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
drawY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 4;

//Text box
width = 320;
height = 32

draw_sprite_ext(sprMenuBox, 0, drawX - 160, drawY - 16, width / sprite_get_width(sprMenuBox), height / sprite_get_height(sprMenuBox), 0, c_white, 1);

//Text
draw_set_font(fntGui);
draw_set_color(c_red);

draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_text(drawX, drawY, gameOverText);

draw_set_color(c_white);