/// @description Variables

enemiesToSpawn = 0;
spawnTime = 0;		//Time before next spawn
spawnRate = 1;		//Enemies per second

ghostChance = 0;	//1 = 100%
graveChance = 0;	//1 = 100%
enemySize = 1;		//1 = 100%
enemySpeed = 1;		//1 = 100%
enemyHpBonus = 0;	//Added to enemy hp

/// @function	doneSpawning()
/// @return {Bool} Returns true if no more enemies to spawn

doneSpawning = function()
{
	return enemiesToSpawn == 0;
}

/// @function	addEnemies(count)
/// @description Adds enemies to spawn.
/// @param {Int} count Amount to add.

addEnemies = function(count)
{
	enemiesToSpawn += count;
}