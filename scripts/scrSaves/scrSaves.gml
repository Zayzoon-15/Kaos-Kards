#region Config

function ssaveConfigGame() : SSave("kaosSave",true) constructor 
{
    //Deck
    add_value("PlayerDeck",SSAVE_TYPE.ARRAY,playerDeck);
}

function ssaveConfigSettings() : SSave("settings",false) constructor 
{
    //Audio
    add_value("MasterVolume",SSAVE_TYPE.REAL,50);
    add_value("MusicVolume",SSAVE_TYPE.REAL,50);
    add_value("SfxVolume",SSAVE_TYPE.REAL,50);
    add_value("VoiceVolume",SSAVE_TYPE.REAL,50);
    add_value("Mute",SSAVE_TYPE.BOOLEAN,true);
    add_value("Voiceover",SSAVE_TYPE.BOOLEAN,true);
    add_value("Subtitles",SSAVE_TYPE.BOOLEAN,true);
    
    //Video
    add_value("Resolution",SSAVE_TYPE.REAL,2);
    add_value("Particle",SSAVE_TYPE.REAL,0);
    add_value("SubtitleStyle",SSAVE_TYPE.STRUCT,global.subtitlesStyle);
    
    //Input
    add_value("Discard",SSAVE_TYPE.REAL,ord("Z"));
    add_value("Fullscreen",SSAVE_TYPE.REAL,vk_f11);
    add_value("Pause",SSAVE_TYPE.REAL,vk_escape);
    add_value("Debug",SSAVE_TYPE.REAL,220);
    add_value("MobilePress",SSAVE_TYPE.BOOLEAN,true);
}

#endregion



#region Game


function saveGameSave()
{
    //Get Save
    var _save = ssave_get(ssaveConfigGame);
    
    //Deck
    _save.set("PlayerDeck",playerDeck);
    
    //Save File
    _save.save();
}

function loadGameSave()
{
    //Get Save
    var _save = ssave_get(ssaveConfigGame);
    
    //Deck
    playerDeck = _save.get("PlayerDeck");
}

#endregion


#region Settings


function saveSettings()
{
    //Get Save
    var _save = ssave_get(ssaveConfigSettings);
    
    //Audio
    _save.set("MasterVolume",global.masterVol);
    _save.set("MusicVolume",global.musicVol);
    _save.set("SfxVolume",global.sfxVol);
    _save.set("VoiceVolume",global.voiceVol);
    _save.set("Mute",global.unfocusMute);
    _save.set("Voiceover",global.voiceover);
    _save.set("Subtitles",global.subtitles);
    
    //Video
    _save.set("Resolution",global.currentRes);
    _save.set("Particle",global.partSelection);
    _save.set("SubtitleStyle",global.subtitlesStyle);
    
    //Input
    _save.set("Discard",global.keyDiscard);
    _save.set("Fullscreen",global.keyFullscreen);
    _save.set("Pause",global.keyPause);
    _save.set("Debug",global.keyDebug);
    _save.set("MobilePress",global.mobilePress);
    
    //Save File
    _save.save();
}

function loadSettings()
{
    //Get Save
    var _save = ssave_get(ssaveConfigSettings);
    
    //Audio
    global.masterVol = _save.get("MasterVolume");
    global.musicVol = _save.get("MusicVolume");
    global.sfxVol = _save.get("SfxVolume");
    global.voiceVol = _save.get("VoiceVolume");
    global.unfocusMute = _save.get("Mute");
    global.voiceover = _save.get("Voiceover");
    global.subtitles = _save.get("Subtitles");
    
    //Video
    global.currentRes = _save.get("Resolution");
    global.partSelection = _save.get("Particle");
    global.subtitlesStyle = _save.get("SubtitleStyle");
    
    //Input
    global.keyDiscard = _save.get("Discard");
    global.keyFullscreen = _save.get("Fullscreen");
    global.keyPause = _save.get("Pause");
    global.keyDebug = _save.get("Debug");
    global.mobilePress = _save.get("MobilePress");
}

#endregion


/*
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
	global.voiceover = ini_read_real("Settings","Voiceover",true);
	global.subtitles = ini_read_real("Settings","Subtitles",true);
	
	//Video
	global.currentRes = ini_read_real("Settings","Resolution",2);
	global.partSelection = ini_read_real("Settings","Particle",0);
	global.subtitlesStyle.boxAlpha = ini_read_real("Settings","SubtitleAlpha",UIBOX_ALPHA);
	global.subtitlesStyle.outlineThickness = ini_read_real("Settings","SubtitleOutline",3);
	global.subtitlesStyle.textScale = ini_read_real("Settings","SubtitleScale",1);
	
	//Input
	global.keyDiscard = ini_read_real("Settings","Discard",ord("Z"));
	global.keyFullscreen = ini_read_real("Settings","Fullscreen",vk_f11);
	global.keyPause = ini_read_real("Settings","Pause",vk_escape);
	global.keyDebug = ini_read_real("Settings","Debug",220);
	global.mobilePress = ini_read_real("Settings","MobilePress",true);
	
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
	ini_write_real("Settings","Subtitles",global.subtitles);
	
	//Video
	ini_write_real("Settings","Resolution",global.currentRes);
	ini_write_real("Settings","Particle",global.partSelection);
	ini_write_real("Settings","SubtitleAlpha",global.subtitlesStyle.boxAlpha);
	ini_write_real("Settings","SubtitleOutline",global.subtitlesStyle.outlineThickness);
	ini_write_real("Settings","SubtitleScale",global.subtitlesStyle.textScale);
	
	//Input
	ini_write_real("Settings","Discard",global.keyDiscard);
	ini_write_real("Settings","Fullscreen",global.keyFullscreen);
	ini_write_real("Settings","Pause",global.keyPause);
	ini_write_real("Settings","Debug",global.keyDebug);
	ini_write_real("Settings","MobilePress",global.mobilePress);
	
	ini_close();
}