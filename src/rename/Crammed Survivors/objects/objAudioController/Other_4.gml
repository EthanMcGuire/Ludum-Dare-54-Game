/// @description Stop all sounds and play music

stopSounds();
stopMusic();

if (room == rmTitle)
{
	//Title music	
}
else
{
	//Game music
	playMusic(sndGameMusic);
	setMusicGain(0, 0);
	setMusicGain(1, 1000);
}