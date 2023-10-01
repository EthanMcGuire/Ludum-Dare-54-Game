/// @function enemySetState(newState)
/// @description Sets the enemys state
/// @param {enemyState} newState The state to go to.
function enemySetState(newState)
{
	state = newState;
	
	//Set sprite
	switch (state)
	{
		case EnemyState.CHASE:
			//Do nothing
			break;
		
		case EnemyState.ATTACK_WALL:
			//Do nothing
			break;
		
		case EnemyState.HURT:
			//Do nothing
			break;
		
		case EnemyState.DEAD:
			//Do nothing
			break;
	}
}


/// @function enemyChaseState()
/// @description Runs during the enemys chase state
function enemyChaseState()
{
	var moveX, moveY;
	var moveDir;

	//Do nothing?
	if (!instance_exists(objPlayer) || point_distance(x, y, objPlayer.x, objPlayer.y) <= chaseRange)
	{
		return;
	}
	
	//Chase the player
	moveDir = point_direction(x, y, objPlayer.x, objPlayer.y);
	
	moveX = lengthdir_x(spd, moveDir);
	moveY = lengthdir_y(spd, moveDir);
	
	if (moveX != 0)
	{
		image_xscale = abs(image_xscale) * sign(moveX);	
	}

	//Move and check for wall collision
	if (moveObject(id, moveX, moveY, parEnemyCollider) && !ignoreWalls)
	{
		wallToAttack = instance_place(x + sign(moveX), y + sign(moveY), parWall);
		
		//Check for wall
		if (wallToAttack != noone)
		{
			currentAttackDelay = attackDelay;
		
			enemySetState(EnemyState.ATTACK_WALL);
		}
	}
		
	//Damage player
	if (place_meeting(x, y, objPlayer))
	{
		objPlayer.takeDamage(moveDir);	
	}
}

/// @function enemyAttackWallState()
/// @description Runs during the enemys attack wall state
function enemyAttackWallState()
{
	//Wall was destroyed?
	if (!instance_exists(wallToAttack))
	{
		enemySetState(EnemyState.CHASE);	
		
		return;
	}
	
	currentAttackDelay--;
	
	//Wait before attacking the wall
	if (currentAttackDelay <= 0)
	{
		currentAttackDelay = attackDelay;
		
		//Attack the wall
		wallToAttack.takeDamage();
	}
}

/// @function enemyHurtState()
/// @description Runs during the enemys hurt state
function enemyHurtState()
{
	var moveX, moveY;
	var goalX, goalY;
	var distanceRemaining, otherDistanceRemaining;
	var moveAmount;
	
	//Move
	moveX = lengthdir_x(knockback, knockbackDir);
	moveY = lengthdir_y(knockback, knockbackDir);
	
	goalX = x + moveX;
	goalY = y + moveY;
	
	//Collision?
	if (moveObject(id, moveX, moveY, parEnemyCollider))
	{
		var collisionObject = instance_place(x + sign(moveX), y + sign(moveY), parEnemyCollider);

		distanceRemaining = point_distance(x, y, goalX, goalY);

		if (collisionObject.object_index == parEnemy || object_is_ancestor(collisionObject.object_index, parEnemy))
		{
			//Atempt to push the enemy
			otherDistanceRemaining = enemyPushEnemy(collisionObject, distanceRemaining, knockbackDir);
			
			moveAmount = distanceRemaining - otherDistanceRemaining;
				
			moveObject(id, lengthdir_x(moveAmount, knockbackDir), lengthdir_y(moveAmount, knockbackDir), parEnemyCollider);
			
			//Pushed enemy detected collision?
			if (otherDistanceRemaining != 0)
			{
				knockback = 0;
			}
		}
		else
		{
			knockback = 0;
		}
	}
	
	knockback = max(knockback - knockbackReduction, 0);
	
	//Knockback done?
	if (knockback == 0)
	{
		enemySetState(EnemyState.CHASE);	
	}
}

/// @function enemyDeadState()
/// @description Runs during the enemys dead state
function enemyDeadState()
{
	instance_destroy();
}

/// @function enemyPushEnemy(enemy, distance, dir)
/// @description Attempts to push the enemy in the given direction.
/// @param {Real} distance Length to push
/// @param {Real} dir Direction to push
/// @return {Real} Returns the remaining distance that couldn't be pushed, or 0 if push was successful.
function enemyPushEnemy(enemy, distance, dir)
{
	var moveX, moveY;
	var goalX, goalY;
	var distanceRemaining, otherDistanceRemaining;
	var moveAmount;
	
	moveX = lengthdir_x(distance, dir);
	moveY = lengthdir_y(distance, dir);
	
	goalX = enemy.x + moveX;
	goalY = enemy.y + moveY;
	
	if (moveObject(id, moveX, moveY, parEnemyCollider))
	{
		var collisionObject = instance_place(x + sign(moveX), y + sign(moveY), parEnemyCollider);

		distanceRemaining = point_distance(x, y, goalX, goalY);

		if (collisionObject.object_index == parEnemy || object_is_ancestor(collisionObject.object_index, parEnemy))
		{
			//Atempt to push the enemy
			otherDistanceRemaining = enemyPushEnemy(collisionObject, distanceRemaining, dir);
			
			moveAmount = distanceRemaining - otherDistanceRemaining;
			
			moveObject(id, lengthdir_x(moveAmount, dir), lengthdir_y(moveAmount, dir), parEnemyCollider);
			
			return otherDistanceRemaining;
		}
		else
		{
			return distanceRemaining;
		}
	}
	
	return 0;
}