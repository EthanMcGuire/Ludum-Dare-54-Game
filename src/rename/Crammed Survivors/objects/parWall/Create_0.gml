/// @description Variables

event_inherited();

hp = 5;	//Hp until destroyed by enemy

collisionsEnabled = false;

canShootOver = false;

spriteDay = sprWallDay;
spriteNight = sprWallNight;

sprite_index = spriteDay;

beingPlaced = true;
canBePlaced = false;

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