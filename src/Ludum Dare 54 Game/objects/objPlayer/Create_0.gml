/// @description Variables

enum PlayerState
{
	IDLE,
	MOVE,
	HURT,
	DEAD
}

state = PlayerState.IDLE;

//Gun
gun = instance_create_layer(x, y, "Gun", parGun);

//Stats
maxHp = 3;
hp = maxHp;
spd = 1;

iframeTime = 90;
iframes = 0;

//knockback
knockback = 0;
knockbackDir = 0;
knockbackReduction = 0.1;
hurtKnockback = 2.5;	//Knockback when hurt

//Sprite
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
	if (iframes > 0 || state == PlayerState.HURT || state == PlayerState.DEAD)
	{
		return;	
	}
	
	hp--;
	
	iframes = iframeTime;
	
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