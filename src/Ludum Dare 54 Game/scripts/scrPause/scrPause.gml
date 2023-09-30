/// @function gamePaused()
/// @return {Bool} Returns true if the game world is paused. Can be pause menu or upgrade menu.
function gamePaused()
{
	return instance_exists(objPauseMenu) || instance_exists(objUpgrade);
}