/// @description Variables

soundVolume = 1;
musicVolume = 1;

music = noone;

sounds = ds_list_create();

/// @function setSoundVolume(volume)
/// @param {Real} volume Volume to set
setSoundVolume = function(volume)
{
	soundVolume = volume;
	
	for (var i = 0; i < ds_list_size(sounds); i++)
	{
		var sound = ds_list_find_value(sounds, i);
		
		audio_sound_gain(sound, soundVolume, 0);
	}
}

/// @function setMusicVolume(volume)
/// @param {Real} volume Volume to set
setMusicVolume = function(volume)
{
	musicVolume = volume;
	
	setMusicGain(musicVolume, 0);
}

/// @function playSound(soundId)
/// @description Plays a sound effect.
/// @param {Sound_ID} soundId The sound index to play.
playSound = function(soundId)
{
	var sound = audio_play_sound(soundId, 1, false);	
	
	audio_sound_gain(sound, soundVolume, 0);
	
	ds_list_add(sounds, sound);
}

/// @function playMenuSound(soundId)
/// @description Plays a menu sound effect. Ignores audio effects except gain.
/// @param {Sound_ID} soundId The sound index to play.
playMenuSound = function(soundId)
{
	var sound = audio_play_sound(soundId, 1, false);	
	
	audio_sound_gain(sound, soundVolume, 0);
}

/// @function stopSounds()
/// @description Stops the sound effects and clears the sound list.
stopSounds = function()
{
	for (var i = 0; i < ds_list_size(sounds); i++)
	{
		var sound = ds_list_find_value(sounds, i);
		
		audio_stop_sound(sound);
	}
	
	ds_list_clear(sounds);
}

/// @function pauseSounds()
/// @description Pauses the sound effects
pauseSounds = function()
{
	for (var i = 0; i < ds_list_size(sounds); i++)
	{
		var sound = ds_list_find_value(sounds, i);
		
		audio_pause_sound(sound);
	}
}

/// @function resumeSounds()
/// @description Resumes the sound effects
resumeSounds = function()
{
	for (var i = 0; i < ds_list_size(sounds); i++)
	{
		var sound = ds_list_find_value(sounds, i);
		
		audio_resume_sound(sound);
	}
}

/// @function playMusic(soundId)
/// @description Plays a song.
/// @param {Sound_ID} soundId The sound index to play.
playMusic = function(soundId)
{
	stopMusic();
	
	music = audio_play_sound(soundId, 1, true);	
	
	setMusicGain(musicVolume, 0);
}

/// @function stopMusic()
/// @description Stops the current music
stopMusic = function()
{
	if (music != noone)
	{
		audio_stop_sound(music);
		music = noone;
	}
}

/// @function pauseMusic()
/// @description Pauses the current music
pauseMusic = function()
{
	if (music != noone)
	{
		audio_pause_sound(music);
	}
}

/// @function resumeMusic()
/// @description Resumes the current music
resumeMusic = function()
{
	if (music != noone)
	{
		audio_resume_sound(music);
	}
}

/// @function setMusicGain(gain, time)
/// @description Sets the music volume
/// @param {Real} gain The gain amount.
/// @param {MS} time Gain change duration
setMusicGain = function(gain, time)
{
	if (music != noone)
	{
		audio_sound_gain(music, gain, time);
	}
}