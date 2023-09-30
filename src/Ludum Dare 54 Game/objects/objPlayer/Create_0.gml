/// @description Variables

enum PlayerState
{
	IDLE,
	MOVE,
	HURT,
	DEAD
}

hp = 3;
spd = 1;
moveDir = 0;

knockback = 0;
knockbackDir = 0;
knockbackReduction = 0.1;

spriteDay = sprPlayerDay;
spriteNight = sprPlayerNight;

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