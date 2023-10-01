/// @description Restart the game

if (instance_exists(objPauseMenu))
{
	return;	
}

if (keyboard_check_pressed(ord("R")))
{
	room_restart();	
}