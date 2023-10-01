/// @description Follow the player and Shoot

if (gamePaused())
{
	return;	
}

//Follow player
followPlayer();

shootDelay = max(shootDelay - 1, 0);

//Shoot
if (shootDelay == 0 && instance_exists(parEnemy))
{
	var enemy;
	
	enemy = instance_nearest(x, y, parEnemy);
	
	//Enemy in shoot range?
	if (point_distance(x, y, enemy.x, enemy.y) <= shootRange)
	{
		shootBullet();
	}
}
