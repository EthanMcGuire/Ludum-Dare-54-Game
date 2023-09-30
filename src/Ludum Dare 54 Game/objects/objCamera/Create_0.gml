/// @description Variables

x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

cameraW = camera_get_view_width(view_camera[0]);
cameraH = camera_get_view_height(view_camera[0]);

xTo = x;	//Goal X
yTo = y;	//Goal Y

screenShake = 0;

active = true;

/// @function moveCamera()
/// @description Moves the camera towards its goal position and applies screenshake.
moveCamera = function()
{
	var shakeX, shakeY;
	
	x = lerp(x, xTo, 1/6);
	y = lerp(y, yTo, 1/6);
	
	if (abs(x - xTo) <= 2 && abs(y - yTo) <= 2)
	{
		x = xTo;
		y = yTo;
	}
	
	shakeX = 0;
	shakeY = 0;
	
	if (screenShake-- > 0)
	{
		shakeX = irandom_range(-1, 1);	
		shakeY = irandom_range(-1, 1);	
	}
	
	setPosition(x + shakeX, y + shakeY);
}

/// @function setPosition(xPos, yPos)
/// @description Sets the cameras position
/// @param {Int} xPos The x position
/// @param {Int} yPos The y position
setPosition = function(xPos, yPos)
{
	x = clamp(xPos, 0, room_width - cameraW);	
	y = clamp(yPos, 0, room_height - cameraH);	
	
	camera_set_view_pos(view_camera[0], round(x), round(y));
}

/// @function setGoalPosition(xPos, yPos)
/// @description Sets the cameras goal position
/// @param {Int} xPos The x position
/// @param {Int} yPos The y position
setGoalPosition = function(xPos, yPos)
{
	xTo = xPos;
	yTo = yPos;
}

/// @function setScreenshake(time)
/// @description Sets the cameras screenshake
/// @param {Real} Screenshake time in frames.
setScreenshake = function(time)
{
	screenShake = time;
}