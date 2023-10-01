/// @description Variables

objAudioController.pauseSounds();
objAudioController.setMusicGain(objAudioController.musicVolume / 2, 250);

optionCount = 3;
optionSelected = -1;

options[0] = "Resume";
options[1] = "Options";
options[2] = "Title";

width = 160;
height = camera_get_view_height(view_camera[0]) / 3;

textYOffset = 28;
textSep = 32;

alarm[0] = 1;