/// @description Variables

player = noone;

playerOffset = 16;
dirFromPlayer = 0;
dirChange = 3;

shootRate = 1;	//Bullets per second
shootDelay = 0;
shootRange = 80;	//5 tile shoot range

bulletObject = objBulletBasic;
bulletSize = 1;

dir = 0;
dmg = 1;
knockbackAmount = 2;

/// @function shootBullet()
/// @description This gun shoots a bullet
shootBullet = function()
{
	var bullet, enemy;
	
	//Get closest enemy
	enemy = instance_nearest(x, y, parEnemy);
	
	//This shouldnt happen
	if (enemy == noone)
	{
		return;	
	}
	
	dir = point_direction(x, y, enemy.x, enemy.y);
	
	if (dir >= 90 && dir < 270)
	{
		image_xscale = -1;	
	}
	else
	{	
		image_xscale = 1;
	}
	
	bullet = instance_create_layer(x, y, "Bullets", bulletObject);
	bullet.dir = dir;
	bullet.dmg = dmg;
	bullet.knockbackAmount = knockbackAmount;
	bullet.image_xscale = bulletSize;
	bullet.image_yscale = bulletSize;
	
	shootDelay = game_get_speed(gamespeed_fps) / shootRate;
}

/// @function followPlayer()
/// @description Ghost circles around the player
followPlayer = function()
{
	dirFromPlayer += dirChange;

	if (dirFromPlayer > 360)
	{
		dirFromPlayer -= 360;	
	}

	x = player.x + lengthdir_x(playerOffset * abs(player.image_xscale), dirFromPlayer);
	y = player.y + lengthdir_y(playerOffset * abs(player.image_xscale), dirFromPlayer);
}