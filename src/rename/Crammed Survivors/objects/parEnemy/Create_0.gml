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

points = 10;

knockback = 0;
knockbackDir = 0;
knockbackReduction = 0.1;

knockbackAmount = 0;

attackSpeed = 1;	//Wall attack per second
currentAttackDelay = 0;
wallToAttack = noone;	//The wall to attack

chaseRange = 8;

/// @function takeDamage(dir, kb, dmg)
/// @description Enemy takes damage. Enemy dies at 0 HP.
/// @param {Real} dir The direction of the attack. Used for knockback.
/// @param {Real} kb Knockback amount
/// @param {Real} dmg The damage this enemy took.
takeDamage = function(dir, kb, dmg)
{
	hp -= dmg;
	
	if (hp <= 0)
	{
		objGameController.addPoints(points);
		
		objAudioController.playSound(sndEnemyDie);
		
		enemySetState(EnemyState.DEAD);	
	}
	else
	{
		knockback = kb;
		knockbackDir = dir;
		
		objAudioController.playSound(sndEnemyHurt);
		
		enemySetState(EnemyState.HURT);	
	}
}