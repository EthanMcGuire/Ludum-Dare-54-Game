/// @description Game control

//Game paused?
if (instance_exists(objPauseMenu))
{
	return;	
}

//Pause the game
if (keyboard_check_pressed(vk_escape))
{
	instance_create_layer(0, 0, "Main", objPauseMenu);
	
	return;
}

//Delay
if (delay > 0)
{
	delay = max(delay - 1, 0);
	
	if (delay == 0)
	{
		changeTime();
		
		if (day)
		{
			//Upgrades!	
			var centerX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
			var centerY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);
			
			instance_create_layer(centerX - 64, centerY, "Main", objUpgrade);
			instance_create_layer(centerX, centerY, "Main", objUpgrade);
			instance_create_layer(centerX + 64, centerY, "Main", objUpgrade);
		}
		else
		{
			//THEIR COMING
			objEnemySpawner.addEnemies(enemyCount);
			
			enemyCount += enemyCountIncrease;
			enemyCountIncrease++;
		}
	}
}
else
{
	//Action
	if (!day)
	{
		//Wait till round is over
		if (instance_number(parEnemy) == 0 && objEnemySpawner.doneSpawning())
		{
			delay = timeDelay;	
		}
	}
	else
	{
		//Wait till the player has chosen an upgrade
		if (!instance_exists(objUpgrade))
		{
			delay = timeDelay;
		}
	}
}