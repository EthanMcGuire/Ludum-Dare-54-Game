/// @description Move and damage enemies

if (gamePaused())
{
	return;	
}

var xMove, yMove;

xMove = lengthdir_x(spd, dir);
yMove = lengthdir_y(spd, dir);

x += xMove;
y += yMove;

//Hit enemy?
if (place_meeting(x, y, parEnemy))
{
	var enemyList = ds_list_create();
	var enemy;
	
	enemy = noone;
	
	instance_place_list(x, y, parEnemy, enemyList, true);
	
	//Get an enemy to damage
	for (var i = 0; i < ds_list_size(enemyList); i++)
	{
		var enemy = ds_list_find_value(enemyList, i);
		
		//Enemy hasn't been hit already?
		if (ds_list_find_index(hitEnemies, enemy) == -1)
		{
			break;
		}
		else
		{
			enemy = noone;	
		}
	}
	
	ds_list_destroy(enemyList);
	
	//Enemy found?
	if (enemy != noone)
	{
		ds_list_add(hitEnemies, enemy);
	
		enemy.takeDamage(dir, knockbackAmount, dmg);
	
		piercing--;
	
		//Destroy
		if (piercing <= 0)
		{
			instance_destroy();	
		}
	}
}
else
{
	//Clear hit enemies list when no long colliding
	ds_list_clear(hitEnemies);	
}

//Hit wall?
if (place_meeting(x, y, parSolid))
{
	var solidList = ds_list_create();
	var obj;
	
	obj = noone;
	
	instance_place_list(x, y, parSolid, solidList, true);
	
	//Get a wall to hit
	for (var i = 0; i < ds_list_size(solidList); i++)
	{
		var obj = ds_list_find_value(solidList, i);
		
		//Make sure the wall is hittable
		if (!obj.canShootOver)
		{
			break;
		}
		else
		{
			obj = noone;	
		}
	}
	
	ds_list_destroy(solidList);
	
	//Wall found?
	if (obj != noone)
	{
		//Hit grave?
		if (obj.object_index == objGrave)
		{
			obj.takeDamage();	
		}
		else
		{
			objAudioController.playSound(sndWallHit);	
		}
		
		instance_destroy();
	}
}

//Out of view?
if (entityOutOfView(id))
{
	instance_destroy();	
}