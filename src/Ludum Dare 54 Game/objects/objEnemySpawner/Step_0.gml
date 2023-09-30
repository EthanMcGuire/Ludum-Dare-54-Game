/// @description Spawn enemies

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
		
		//Enemy has grave?
		if (random(1) <= graveChance)
		{
			grave = true;	
		}
		
		if (random(1) <= ghostChance)
		{
			//Spawn ghost	
			enemy = instance_create_layer(x, y, "Enemies", objGhost);
		}
		else
		{
			//Spawn zombie	
			enemy = instance_create_layer(x, y, "Enemies", objZombie);
		}
			
		//Set enemy variables
		enemy.grave = true;
		enemy.image_xscale *= enemySize;
		enemy.image_yscale *= enemySize;
		enemy.spd *= enemySpeed;
		enemy.hp += enemyHpBonus;
		
		//Set spawn time
		spawnTime = game_get_speed(gamespeed_fps) / spawnRate;
	}
}
