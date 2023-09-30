/// @description Variables

hp = 5;	//Hp until destroyed by enemy

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

/// @function takeDamage()
/// @description This wall takes 1 damage. If at 0 HP, the wall is destroyed. Plays a damage sound.
takeDamage = function()
{
	hp--;
	
	//Destroyed?
	if (hp > 0)
	{
		objAudioController.playSound(sndWallDamage);
	}
	else
	{
		//play sound
		objAudioController.playSound(sndWallBreak);
		
		instance_destroy();
	}
}