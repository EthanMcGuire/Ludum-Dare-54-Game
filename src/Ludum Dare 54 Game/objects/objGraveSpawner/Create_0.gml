/// @description Grave spawn function

depth = 10;

/// @function spawnGrave()
spawnGrave = function()
{
	instance_create_layer(x, y, "Objects", objGrave);	
	
	instance_destroy();
}