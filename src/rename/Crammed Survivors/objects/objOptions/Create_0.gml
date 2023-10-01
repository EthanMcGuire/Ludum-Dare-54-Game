/// @description Variables

depth -= 100;

optionCount = 3;
optionSelected = -1;

options[0] = "Return";
options[1] = "Music";
options[2] = "Sound";

optionIsSlider[0] = false;
optionIsSlider[1] = true;
optionIsSlider[2] = true;

optionSliderValue[0] = -1;
optionSliderValue[1] = objAudioController.musicVolume;
optionSliderValue[2] = objAudioController.soundVolume;

sliderWidth = 64;
sliderOffset = 64;

width = 160;
height = camera_get_view_height(view_camera[0]) / 3;

textYOffset = 28;
textSep = 32;

alarm[0] = 1;