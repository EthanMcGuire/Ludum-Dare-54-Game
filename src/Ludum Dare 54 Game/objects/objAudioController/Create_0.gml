/// @description Insert description here
// You can write your code in this editor

music = noone;
musicPaused = false;

/// @function playSound(soundId)
/// @description Plays a sound effect.
/// @param {Sound_ID} soundId The sound index to play.
playSound = function(soundId)
{
	audio_play_sound(soundId, 1, false);	
}

/// @function pauseSounds()
/// @description Pauses the sound effects
pauseSounds = function()
{
	audio_pause_all();
	
	if (!musicPaused)
	{
		resumeMusic();
	}
}

/// @function resumeSounds()
/// @description Resumes the sound effects
resumeSounds = function()
{
	audio_resume_all();
	
	if (musicPaused)
	{
		pauseMusic();	
	}
}

/// @function playMusic(soundId)
/// @description Plays a song.
/// @param {Sound_ID} soundId The sound index to play.
playMusic = function(soundId)
{
	stopMusic();
	
	music = audio_play_sound(soundId, 1, true);	
	musicPaused = false;
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
		musicPaused = true;
	}
}

/// @function resumeMusic()
/// @description Resumes the current music
resumeMusic = function()
{
	if (music != noone)
	{
		audio_resume_sound(music);
		musicPaused = false;
	}
}

/// @function setMusicGain(gain, time)
/// @description RSets the music volume
/// @param {Double} gain The gain amount.
/// @param {MS} time Gain change duration
setMusicGain = function(gain, time)
{
	if (music != noone)
	{
		audio_sound_gain(music, gain, time);
	}
}