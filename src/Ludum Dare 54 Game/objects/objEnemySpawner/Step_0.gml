/// @description Spawn enemies

if (gamePaused())
{
	return;	
}

//Enemies to spawn?
if (enemiesToSpawn > 0)
{
	spawnTime = max(spawnTime - 1, 0);
	
	//Ready?
	if (spawnTime == 0)
	{
		//Spawn enemy
		enemiesToSpawn--;
		
		var grave = false;
		var enemy = noone;
		var spawnX, spawnY;
		var centerX, centerY;
		var success;
		
		//Enemy has grave?
		if (random(1) <= graveChance)
		{
			grave = true;	
		}
		
		//Spawn the enemy
		if (random(1) <= ghostChance)
		{
			//Spawn ghost	
			enemy = instance_create_layer(0, 0, "Objects", objGhost);
		}
		else
		{
			//Spawn zombie	
			enemy = instance_create_layer(0, 0, "Objects", objZombie);
		}
		
		centerX = room_width / 2;
		centerY = room_height / 2;
		
		//Set spawn position
		do
		{
			spawnX = irandom_range(centerX - spawnDistanceRadius, centerX + spawnDistanceRadius);
			spawnY = irandom_range(centerY - spawnDistanceRadius, centerY + spawnDistanceRadius);
			
			success = true;	
			
			if (point_distance(centerX, centerY, spawnX, spawnY) < minSpawnDistance)
			{
				success = false;	
			}
			else if (entityCollision(enemy, spawnX, spawnY, parEnemy))
			{
				success = false;	
			}
		}
		until (success);
			
		enemy.x = spawnX;
		enemy.y = spawnY;
		
		//Set enemy variables
		enemy.grave = false;
		enemy.image_xscale *= enemySize;
		enemy.image_yscale *= enemySize;
		enemy.spd *= enemySpeed;
		enemy.hp += enemyHpBonus;
		
		//Set spawn time
		spawnTime = game_get_speed(gamespeed_fps) / spawnRate;
	}
}
