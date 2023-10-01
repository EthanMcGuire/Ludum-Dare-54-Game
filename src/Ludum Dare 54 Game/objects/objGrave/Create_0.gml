/// @description Variables

event_inherited();

hp = 5;

canShootOver = false;

spriteDay = sprGraveDay;
spriteNight = sprGraveNight;

sprite_index = spriteDay;

objAudioController.playSound(sndGraveRise);
objCamera.setScreenshake(15);

//Check if meeting player
with (objPlayer)
{
	if (place_meeting(x, y, other))
	{
		unstuckPlayer(id);	
	}
}

/// @function takeDamage()
/// @description This grave takes 1 damage. If at 0 HP, the grave is destroyed. Plays a damage sound.
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