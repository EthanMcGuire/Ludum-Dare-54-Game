/// @description Draw game over text

var drawX, drawY;
var width, height;

draw_set_font(fntGui);

drawX = camera_get_view_width(view_camera[0]) / 2;
drawY = camera_get_view_height(view_camera[0]) / 4;

//Text box
width = string_width("Game Over - You scored " + getPointText(objGameController.points) + " points") + 16;
height = 64;

draw_sprite_ext(sprMenuBox, 0, drawX - width / 2, drawY - height / 2, width / sprite_get_width(sprMenuBox), height / sprite_get_height(sprMenuBox), 0, c_white, 1);

//Text
draw_set_halign(fa_left);
draw_set_valign(fa_center);

//Score text
var text = "Game Over - You scored ";

draw_set_color(c_red);
draw_text(drawX - width / 2 + 4, drawY - 16, "Game Over - You scored ");

draw_set_color(c_green);
draw_text(drawX - width / 2 + 4 + string_width(text), drawY - 16, getPointText(objGameController.points));

var text = "Game Over - You scored " + getPointText(objGameController.points);

draw_set_color(c_red);
draw_text(drawX - width / 2 + 4 + string_width(text), drawY - 16, " points!");

draw_set_halign(fa_center);

draw_text(drawX, drawY + 16, "Press R to restart");

draw_set_color(c_white);