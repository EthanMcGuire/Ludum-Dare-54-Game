/// @description State Control

if (gamePaused())
{
	return;	
}

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

