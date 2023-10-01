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

drawX = heartBoxXOffset;
drawY = heartBoxYOffset;

//Draw hp
draw_sprite_ext(sprHeartBox, 0, drawX, drawY, heartBoxWidth / sprite_get_width(sprHeartBox), heartBoxHeight / sprite_get_height(sprHeartBox), 0, c_white, 1);

drawX += heartXOffset;
drawY += heartYOffset;

for (i = 0; i < maxHp; i++)
{
	draw_sprite(sprHeart, playerHp > i, drawX, drawY);
	
	drawX += heartSep;
}

//Draw score
drawX = scoreBoxXOffset;
drawY = scoreBoxYOffset;

draw_sprite_ext(sprScoreBox, 0, drawX, drawY, scoreBoxWidth / sprite_get_width(sprScoreBox), scoreBoxHeight / sprite_get_height(sprScoreBox), 0, c_white, 1);

draw_set_font(fntGame);
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_text(drawX + scoreBoxWidth / 2, drawY + scoreBoxHeight / 2, getPointText(objGameController.points));

//Draw enemy count
draw_set_halign(fa_right);

drawX = camera_get_view_width(view_camera[0]) - 16;
drawY = 16;

draw_sprite(sprSkull, 0, drawX, drawY);
drawTextOutline(drawX - 12, drawY, string(instance_number(parEnemy)), c_red, c_white);