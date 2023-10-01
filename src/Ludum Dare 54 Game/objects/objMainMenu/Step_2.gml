/// @description Select options

if (alarm[0] != -1)
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
	
	textY += textYOffset;
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
				room_goto(rmGame);
				break;
			
			case 1:
				//Options
				break;
			
			case 2:
				game_end(0);
				break;
		}
	}
}