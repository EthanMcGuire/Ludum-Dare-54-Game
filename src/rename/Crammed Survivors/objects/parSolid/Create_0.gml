/// @description Variables

canShootOver = false;

spriteDay = sprWallDay;
spriteNight = sprWallNight;

sprite_index = spriteDay;

/// @function switchSprite()
/// @description Switches the player sprite from day to night or vice versa.
switchSprite = function()
{
	if (sprite_index == spriteDay)
	{
		sprite_index = spriteNight;	
	}
	else
	{
		sprite_index = spriteDay;	
	}
}