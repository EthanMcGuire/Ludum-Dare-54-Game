/// @description Game control

//Start delay
if (alarm[1] != -1)
{
	return;	
}

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
	if (day && (delay == 180 ||delay == 120 || delay == 60))
	{
		objAudioController.playSound(sndTimer);	
	}
	
	delay = max(delay - 1, 0);
	
	if (delay == 0)
	{
		changeTime();
		
		if (day)
		{
			//Upgrades!	
			alarm[0] = upgradeDelay;
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
			
			//Increase point multiplier for winning
			pointMultiplier += 0.5;
		}
	}
	else
	{
		//Wait till the player has chosen an upgrade
		if (alarm[0] == -1 && !instance_exists(objUpgrade) && !instance_exists(objWallPlacer))
		{
			alarm[1] = 60;	//Delay before starting the timer
			delay = timeDelay;
		}
	}
}