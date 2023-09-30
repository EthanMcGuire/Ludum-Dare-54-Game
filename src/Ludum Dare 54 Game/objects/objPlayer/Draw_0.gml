/// @description Draw the player

show_debug_message("Player x = {0}, player y = {1}", x, y);

draw_sprite_ext(sprite_index, image_index, round(x), round(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);