/// @description Gun variables

holdingShoot = false;	//Used for hold firing

shootRate = 1.5;	//Bullets per second
shootDelay = 0;

bulletObject = objBulletBasic;
bulletOffsetBase = 3;	//Offset to the nozzle
bulletOffset = bulletOffsetBase;
bulletSize = 1;

dir = 0;
dmg = 1;
knockbackAmount = 2;

/// @function shootBullet()
/// @description This gun shoots a bullet
shootBullet = function()
{
	var bullet;
	
	aim();	//Increase accuracy
	
	bullet = instance_create_layer(x + lengthdir_x(bulletOffset, dir), y + lengthdir_y(bulletOffset, dir), "Bullets", bulletObject);
	bullet.dir = dir;
	bullet.dmg = dmg;
	bullet.knockbackAmount = knockbackAmount;
	bullet.image_xscale = bulletSize;
	bullet.image_yscale = bulletSize;
	
	shootDelay = game_get_speed(gamespeed_fps) / shootRate;
}

/// @function setPosition(xPos, yPos)
/// @description Sets the guns position.
/// @param {Real} xPos The x position
/// @param {Real} yPos The y position
setPosition = function(xPos, yPos)
{
	x = xPos;
	y = yPos;
}

/// @function aim()
/// @description Aims the gun at the mouse
aim = function()
{
	dir = point_direction(x, y, mouse_x, mouse_y);
	
	image_angle = dir;
	
	if (dir >= 90 && dir < 270)
	{
		image_yscale = -1 * abs(image_yscale);	
	}
	else
	{
		image_yscale = 1 * abs(image_yscale);	
	}
}