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
if (gun != noone)
{
	gun.setPosition(x , y + abs(image_yscale) * 3);
	gun.aim();
}