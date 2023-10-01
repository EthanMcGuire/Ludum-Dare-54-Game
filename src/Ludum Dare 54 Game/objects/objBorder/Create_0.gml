/// @description Variables

//Size in tiles
sizeX = 18;
sizeY = 18;

goalX = sizeX;
goalY = sizeY;

sizeMinX = 5;
sizeMinY = 5;
sizeMaxX = 26;
sizeMaxY = 20;

sizeChange = 0.1;

width = 0;
height = 0;

/// @function setSize(xSize, ySize)
/// @description Sets the border size in tiles. Also sets the borders scale and position.
/// @param {Real} xSize X tile size
/// @param {Real} ySize Y tile size
setSize = function(xSize, ySize)
{
	sizeX = clamp(xSize, sizeMinX, sizeMaxX);
	sizeY = clamp(ySize, sizeMinY, sizeMaxY);
	
	width = sizeX * 16;
	height = sizeY * 16;

	image_xscale = width / sprite_get_width(sprite_index);
	image_yscale = height / sprite_get_height(sprite_index);

	x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - width / 2;
	y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - height / 2;
	
	x = (x div 16) * 16;
	y = (y div 16) * 16;
}

/// @function setSizeGoal(xSize, ySize)
/// @description Sets the border goal size in tiles.
/// @param {Real} xSize X tile size
/// @param {Real} ySize Y tile size
setSizeGoal = function(xSize, ySize)
{
	goalX = clamp(xSize, sizeMinX, sizeMaxX);
	goalY = clamp(ySize, sizeMinY, sizeMaxY);
}

/// @function shrinkBorder(amount)
/// @param {Real} amount Amount to shrink the border in tiles.
shrinkBorder = function(amount)
{
	setSizeGoal(goalX - amount, goalY - amount);
}

/// @function enlargeBorder(amount)
/// @param {Real} amount Amount to enlarge the border in tiles.
enlargeBorder = function(amount)
{
	setSizeGoal(goalX + amount, goalY + amount);
}

setSize(sizeX, sizeY);