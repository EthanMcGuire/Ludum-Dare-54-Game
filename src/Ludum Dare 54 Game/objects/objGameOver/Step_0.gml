/// @description Restart the game

if (global.gamePaused)
{
	return;	
}

if (keyboard_check_pressed(ord("R")))
{
	room_restart();	
}