/// @function playerSetState(newState)
/// @description Sets the players state
/// @param {PlayerState} newState The state to go to.
function playerSetState(newState)
{
	state = newState;
	
	//Set sprite
	switch (state)
	{
		case PlayerState.IDLE:
			//Do nothing
			break;
		
		case PlayerState.MOVE:
			//Do nothing
			break;
		
		case PlayerState.HURT:
			//Do nothing
			break;
		
		case PlayerState.DEAD:
			//Do nothing
			break;
	}
}

/// @function playerIdleState()
/// @description Runs during the players idle state
function playerIdleState()
{
	var moveX, moveY;
	
	moveX = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	moveY= keyboard_check(ord("S")) - keyboard_check(ord("W"));
	
	//Moving?
	if (moveX != 0 || moveY != 0)
	{
		playerSetState(PlayerState.MOVE);	
	}
}


/// @function playerMoveState()
/// @description Runs during the players move state
function playerMoveState()
{
	var moveX, moveY;
	var moveDir;
	
	moveX = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	moveY = keyboard_check(ord("S")) - keyboard_check(ord("W"));
	
	//Stopped moving?
	if (moveX == 0 && moveY == 0)
	{
		playerSetState(PlayerState.IDLE);
		
		return;
	}
	
	//Move
	moveDir = point_direction(x, y, x + moveX, y + moveY);
	
	//moveX = lengthdir_x(spd, moveDir);
	//moveY = lengthdir_y(spd, moveDir);
	
	moveX *= spd;
	moveY *= spd;
	
	if (moveX != 0)
	{
		image_xscale = abs(image_xscale) * sign(moveX);	
	}
	
	moveObject(id, moveX, moveY, parSolid);
}

/// @function playerHurtState()
/// @description Runs during the players hurt state
function playerHurtState()
{
	var moveX, moveY;
	
	//Move
	moveX = lengthdir_x(knockback, knockbackDir);
	moveY = lengthdir_y(knockback, knockbackDir);
	
	//Collision?
	if (moveObject(id, moveX, moveY, parSolid))
	{
		knockback = 0;
	}
	
	knockback = max(knockback - knockbackReduction, 0);
	
	//Knockback done?
	if (knockback == 0)
	{
		playerSetState(PlayerState.IDLE);	
	}
}

/// @function playerDeadState()
/// @description Runs during the players dead state
function playerDeadState()
{
	//Fade away
	image_alpha = max(image_alpha - 0.02, 0);
	
	if (image_alpha == 0)
	{
		//Game over
		instance_create_layer(0, 0, "Main", objGameOver);
		
		instance_destroy();	
	}
}