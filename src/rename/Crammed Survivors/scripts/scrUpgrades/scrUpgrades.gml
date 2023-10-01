/// @function addUpgrade(index)
/// @param {Real} index Upgrade index to add
function addUpgrade(index)
{
	switch (index)
	{
		case 0:
			objPlayer.maxHp += 1;
			objPlayer.hp += 1;
			objPlayer.image_xscale += sign(objPlayer.image_xscale)
			objPlayer.image_yscale += sign(objPlayer.image_yscale)
			
			//Unstuck the player
			with (objPlayer)
			{
				if (place_meeting(x, y, parSolid))
				{
					unstuckPlayer(id);
				}
			}
			break;
		
		case 1:
			objPlayer.gun.dmg += 1;
			objPlayer.gun.image_xscale += sign(objPlayer.gun.image_xscale);
			objPlayer.gun.image_yscale += sign(objPlayer.gun.image_yscale);
			objPlayer.gun.bulletOffset += objPlayer.gun.bulletOffsetBase;
			objPlayer.gun.bulletSize += 1;
			
			break;
			
		case 2:
			objEnemySpawner.enemySize += 1;
			objEnemySpawner.enemySpeed -= 0.2;
			break;
			
		case 3:
			objEnemySpawner.spawnRate -= 0.25;
			objEnemySpawner.graveChance += 0.10;
			break;
			
		case 4:
			objPlayer.gun.shootRate += 0.5;
			objEnemySpawner.enemyWallAttackSpeed += 0.2;
			break;
			
		case 5:
			if (objPlayer.ghost == noone)
			{
				var ghost = instance_create_layer(objPlayer.x, objPlayer.y, "Gun", objGhostAlly);
				
				objPlayer.ghost = ghost;
				ghost.player = objPlayer;
				ghost.followPlayer();
				
				objEnemySpawner.ghostChance += 0.10;
			}
			else
			{
				objPlayer.ghost.shootRate += 0.5;
				objEnemySpawner.ghostChance += 0.05;
			}
			
			break;
			
		case 6:
			objPlayer.gun.knockbackAmount += 0.5;
			objEnemySpawner.enemyKnockback += 0.5;
			break;
			
		case 7:
			objPlayer.spd += 0.25;
			objBorder.shrinkBorder(1);
			break;
			
		case 8:
			objGameController.coverWallChance += 0.10;
			
			instance_create_layer(0, 0, "Main", objWallPlacer);
			
			break;
			
		case 9:
			objBorder.enlargeBorder(1);
			objEnemySpawner.spawnRate += 0.25;
			break;
	}
}

/// @function getRandomUpgrade()
/// @description Gets a random upgrade. If the upgrade is maxed out, skips it.
/// @return {Real} Upgrade index
function getRandomUpgrade()
{
	var success = false;
	var upgrade = -1;
	
	while (!success)
	{
		upgrade = irandom_range(0, 9);
		
		if (!upgradeMaxReached(upgrade))
		{
			success = true;	
		}
	}
	
	return upgrade;
}

/// @function upgradeMaxReached(index)
/// @param {Real} index Upgrade index to check
/// @return {Bool} Returns true if the upgrade limit has been reached.
function upgradeMaxReached(index)
{
	switch (index)
	{
		case 0:
			return false;
		
		case 1:
			return false;
			
		case 2:
			//Min speed reached?
			if (objEnemySpawner.enemySpeed == 0.40)
			{
				return true;	
			}
			else
			{
				return false;	
			}
			
		case 3:
			//Min spawn rate reached?
			if (objEnemySpawner.spawnRate == 0.25)
			{
				return true;	
			}
			else
			{
				return false;	
			}
			
		case 4:
			return false;	
			
		case 5:
			//Max ghost chance reached?
			if (objEnemySpawner.ghostChance >= 1.0)
			{
				return true;	
			}
			else
			{
				return false;	
			}
			
		case 6:
			return false;
			
		case 7:
			//Min border size reached?
			if (objBorder.sizeX == objBorder.sizeMinX && objBorder.sizeY == objBorder.sizeMinY)
			{
				return true;
			}
			else
			{
				return false;	
			}
			
		case 8:
			return false;
			
		case 9:
			//Max border size reached?
			if (objBorder.sizeX == objBorder.sizeMaxX && objBorder.sizeY == objBorder.sizeMaxY)
			{
				return true;
			}
			else
			{
				return false;	
			}
	}
}

/// @function getUpgradeName(index)
/// @param {Real} index Upgrade index to get name of
/// @return {String} Upgrade name
function getUpgradeName(index)
{
	var text = "";
	
	switch (index)
	{
		case 0:
			text = "Big Body";
			break;
		
		case 1:
			text = "Stronger Guns";
			break;
			
		case 2:
			text = "Slow Mobs";
			break;
			
		case 3:
			text = "Sleepy Mobs";
			break;
			
		case 4:
			text = "Quick Fire";
			break;
			
		case 5:
			text = "Ghostly Ally";
			break;
			
		case 6:
			text = "Showdown";
			break;
			
		case 7:
			text = "Jogger";
			break;
			
		case 8:
			text = "Defenses";
			break;
			
		case 9:
			text = "Bigger Border";
			break;
	}
	
	return text;
}

/// @function getUpgradeText(index)
/// @param {Real} index Upgrade index to get description of
/// @return {String} Upgrade description
function getUpgradeText(index)
{
	var text = "";
	
	switch (index)
	{
		case 0:
			text = "Max HP + 1, but your size increases.";
			break;
		
		case 1:
			text = "+1 gun damage, but your gun and bullets are bigger.";
			break;
			
		case 2:
			text = "Mobs are 20% slower but have increased size.";
			break;
			
		case 3:
			text = "Mobs spawn rate is 0.25 less, but +10% chance enemies spawn graves.";
			break;
			
		case 4:
			text = "Fire rate +50%, but enemies break walls +20% faster.";
			break;
			
		case 5:
			if (objPlayer.ghost == noone)
			{
				text = "Get a ghost ally, but +10% chance of ghost enemies.";
			}
			else
			{
				text = "Your ghost is +50% faster, but +5% chance of ghost enemies.";	
			}
			
			break;
			
		case 6:
			text = "Your gun knockback and enemy knockback increases.";
			break;
			
		case 7:
			text = "Move speed increases by 25%, but the border size decreases.";
			break;
			
		case 8:
			text = "Increases cover wall chance by 10%, place 5 walls.";
			break;
			
		case 9:
			text = "Border size increases, but mob spawn rate increases by 0.25.";
			break;
	}
	
	return text;
}