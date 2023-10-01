/// @description Select options

if (alarm[0] != -1)
{
	return;	
}

var textX, textY;

textX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
textY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;

textX = textX - (width / 2) + 8;

textY -= height / 2;
textY += textYOffset;

if (optionSelected != -1)
{
	if (!optionIsSlider[optionSelected] || !mouse_check_button(mb_left))
	{
		optionSelected = -1;
	}
}

//Select a option
if (optionSelected == -1)
{
	for (var i = 0; i < optionCount; i++)
	{
		if (!optionIsSlider[i])
		{
			if (collision_rectangle(textX, textY - 12, textX + string_width(options[i]), textY + 12, objMouse, false, true))
			{
				optionSelected = i;
			}
		}
		else
		{
		
			if (collision_rectangle(textX + sliderOffset + sliderWidth * optionSliderValue[i] - 8, textY - 8, textX + sliderOffset + sliderWidth * optionSliderValue[i] + 8, textY + 8, objMouse, false, true))
			{
				optionSelected = i;
			}	
		}
	
		textY += textSep;
	}
}

//Select option
if (optionSelected != -1)
{
	if (!optionIsSlider[optionSelected])
	{
		//Confirm option
		if (mouse_check_button_pressed(mb_left))
		{
			objAudioController.playMenuSound(sndMenuSelect);
		
			switch (optionSelected)
			{
				case 0:
					if (instance_exists(objMainMenu))
					{
						objMainMenu.alarm[0] = 1;	
					}
					
					instance_destroy();
					break;

				default:
					break;
			}
		}
	}
	else if (mouse_check_button(mb_left))
	{
		//Set slider value
		optionSliderValue[optionSelected] = clamp( (mouse_x - (textX + sliderOffset)) / sliderWidth, 0, 1);
		
		switch (optionSelected)
		{
			case 1:
				objAudioController.setMusicVolume(optionSliderValue[optionSelected]);
				break;

			case 2:
				objAudioController.setSoundVolume(optionSliderValue[optionSelected]);
				break;
			
			default:
				break;
		}
	}
}
