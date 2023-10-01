/// @description Select options

if (alarm[0] != -1)
{
	return;	
}

//Unpause
if (keyboard_check_pressed(vk_escape))
{
	with (objOptions)
	{
		instance_destroy();	
	}
	
	instance_destroy();
	
	return;
}

//In options menu?
if (instance_exists(objOptions))
{
	return;	
}

var textX, textY;

textX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
textY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;

textY -= height / 2;
textY += textYOffset;

optionSelected = -1;

//Check for moused over options
for (var i = 0; i < optionCount; i++)
{
	if (collision_rectangle(textX - string_width(options[i]) / 2, textY - 12, textX + string_width(options[i]) / 2, textY + 12, objMouse, false, true))
	{
		optionSelected = i;
	}
	
	textY += textSep;
}

//Select option
if (mouse_check_button_pressed(mb_left))
{
	if (optionSelected != -1)
	{
		objAudioController.playMenuSound(sndMenuSelect);
		
		switch (optionSelected)
		{
			case 0:
				instance_destroy();
				break;
			
			case 1:
				instance_create_layer(0, 0, "Main", objOptions);
				break;
			
			case 2:
				room_goto(rmTitle);
				break;
		}
	}
}