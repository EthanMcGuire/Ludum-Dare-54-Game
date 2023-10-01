/// @description Shoot the gun

if (gamePaused())
{
	return;	
}

shootDelay = max(shootDelay - 1, 0);

//Hold file
if (!holdingShoot && mouse_check_button_pressed(mb_left))
{
	holdingShoot = true;	
}
else if (!mouse_check_button(mb_left))
{
	holdingShoot = false;
}

//Shoot
if (shootDelay == 0 && (mouse_check_button_pressed(mb_left) || holdingShoot ) )
{
	holdingShoot = true;
	
	shootBullet();
}

