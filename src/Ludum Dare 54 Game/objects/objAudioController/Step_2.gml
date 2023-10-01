/// @description Remove finished sounds

var soundsNew = ds_list_create();

//Get sounds that are still playing
for (var i = 0; i < ds_list_size(sounds); i++)
{
	var sound = ds_list_find_value(sounds, i);
	
	//Sound is playing?
	if (audio_is_playing(sound) || audio_is_paused(sound))
	{	
		ds_list_add(soundsNew, sound);
	}
}

ds_list_copy(sounds, soundsNew);
ds_list_destroy(soundsNew);