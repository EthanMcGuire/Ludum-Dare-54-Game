/// @description Variables

enum EnemyState
{
	CHASE,
	ATTACK_WALL,
	HURT,
	DEAD
}

state = EnemyState.CHASE;
ignoreWalls = false;	//Whether this enemy can go through walls
grave = false;		//Whether to drop a grave after death

hp = 3;
spd = 1;
moveDir = 0;

knockback = 0;
knockbackDir = 0;
knockbackReduction = 0.1;