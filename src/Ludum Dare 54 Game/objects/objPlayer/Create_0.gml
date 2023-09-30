/// @description Variables

enum PlayerState
{
	IDLE,
	MOVE,
	HURT,
	DEAD
}

state = PlayerState.IDLE;

hp = 3;
spd = 1;

moveXRemainder = 0;
moveYRemainder = 0;

knockback = 0;
knockbackDir = 0;
knockbackReduction = 0.1;
hurtKnockback = 2;	//Knockback when hurt

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

/// @function takeDamage(dir)
/// @description Player takes 1 damage. Player dies at 0 HP.
/// @param {Real} dir The direction of the attack. Used for knockback.
takeDamage = function(dir)
{
	hp--;
	
	if (hp == 0)
	{
		objAudioController.playSound(sndPlayerDie);
		
		playerSetState(PlayerState.DEAD);	
	}
	else
	{
		knockback = hurtKnockback;
		knockbackDir = dir;
		
		objAudioController.playSound(sndPlayerHurt);
		
		playerSetState(PlayerState.HURT);	
	}
}