/// @description State Control

if (!gamePaused())
{
	switch (state)
	{
		case PlayerState.IDLE:
			playerIdleState();
			break;
		
		case PlayerState.MOVE:
			playerMoveState();
			break;
		
		case PlayerState.HURT:
			playerHurtState();
			break;
		
		case PlayerState.DEAD:
			playerDeadState();
			break;
	}
}

//Set gun position
gun.setPosition(x, y);
gun.aim();