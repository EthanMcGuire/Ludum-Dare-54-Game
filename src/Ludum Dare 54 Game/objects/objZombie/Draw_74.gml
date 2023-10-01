/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_red);
draw_set_alpha(0.5);

draw_rectangle(bbox_left, bbox_top, bbox_right - 1, bbox_bottom - 1, false);

draw_set_color(c_white);
draw_set_alpha(1);