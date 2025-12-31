function saveLoad()
{	
	//Settings For Now
	ini_open("Settings.sav");
	
	//Audio
	global.masterVol = ini_read_real("Settings","MasterVol",50);
	global.musicVol = ini_read_real("Settings","MusicVol",50);
	global.sfxVol = ini_read_real("Settings","SfxVol",50);
	global.voiceVol = ini_read_real("Settings","VoiceVol",50);
	global.unfocusMute = ini_read_real("Settings","Mute",false);
	global.voiceover = ini_read_real("Settings","Voiceover",false);
	
	//Video
	global.currentRes = ini_read_real("Settings","Resolution",2);
	global.partSelection = ini_read_real("Settings","Particle",0);
	
	//Input
	global.keyDiscard = ini_read_real("Settings","Discard",ord("Z"));
	global.keyFullscreen = ini_read_real("Settings","Fullscreen",vk_f11);
	global.keyPause = ini_read_real("Settings","Pause",vk_escape);
	global.keyDebug = ini_read_real("Settings","Debug",220);
	
	ini_close();
}

function saveGame()
{
	
	//Settings For Now
	ini_open("Settings.sav");
	
	//Audio
	ini_write_real("Settings","MasterVol",global.masterVol);
	ini_write_real("Settings","MusicVol",global.musicVol);
	ini_write_real("Settings","SfxVol",global.sfxVol);
	ini_write_real("Settings","VoiceVol",global.voiceVol);
	ini_write_real("Settings","Mute",global.unfocusMute);
	ini_write_real("Settings","Voiceover",global.voiceover);
	
	//Video
	ini_write_real("Settings","Resolution",global.currentRes);
	ini_write_real("Settings","Particle",global.partSelection);
	
	//Input
	ini_write_real("Settings","Discard",global.keyDiscard);
	ini_write_real("Settings","Fullscreen",global.keyFullscreen);
	ini_write_real("Settings","Pause",global.keyPause);
	ini_write_real("Settings","Debug",global.keyDebug);
	
	ini_close();
}