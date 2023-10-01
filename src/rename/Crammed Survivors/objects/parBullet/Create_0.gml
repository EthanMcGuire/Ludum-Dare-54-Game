/// @description Variables

objAudioController.playSound(sndShoot);

dir = 0;
spd = 3;
dmg = 0;	//Set by gun
knockbackAmount = 0;	//Set by gun

piercing = 0;	//Amount of piercing

hitEnemies = ds_list_create();	//Hit enemies so the same enemy isnt hit twice