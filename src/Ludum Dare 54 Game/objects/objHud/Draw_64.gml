/// @description Draw the Hud

//Update player info
if (instance_exists(objPlayer))
{
	maxHp = objPlayer.maxHp;
	playerHp = objPlayer.hp;
	
	heartBoxWidth = maxHp * (16 + 4) - 4 + 8;
}

var drawX, drawY;
var i;

drawX = camera_get_view_x(view_camera[0]) + heartBoxXOffset;
drawY = camera_get_view_y(view_camera[0]) + heartBoxYOffset;

//Draw hp
draw_sprite_ext(sprHeartBox, 0, drawX, drawY, heartBoxWidth / sprite_get_width(sprHeartBox), heartBoxHeight / sprite_get_height(sprHeartBox), 0, c_white, 1);

drawX += heartXOffset;
drawY += heartYOffset;

for (i = 0; i < maxHp; i++)
{
	draw_sprite(sprHeart, playerHp > i, drawX, drawY);
	
	drawX += heartSep;
}