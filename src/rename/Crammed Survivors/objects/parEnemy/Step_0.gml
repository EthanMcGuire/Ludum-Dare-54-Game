/// @description State control

if (gamePaused())
{
	return;	
}


switch (state)
{
	case EnemyState.CHASE:
		enemyChaseState();
		break;
		
	case EnemyState.ATTACK_WALL:
		enemyAttackWallState();
		break;
		
	case EnemyState.HURT:
		enemyHurtState();
		break;
		
	case EnemyState.DEAD:
		enemyDeadState();
		break;
}
