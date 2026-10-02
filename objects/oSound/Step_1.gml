///@desc Set Volume

//Set Targets
var _ease = .3;
var _masterTarget =  global.masterVol/100;//power(global.masterVol/100,2);
var _musicTarget = global.musicVol/200;
var _sfxTarget = global.sfxVol/50;
var _voiceTarget = global.voiceVol/50;

//Unfocus Mute
if global.unfocusMute and !window_has_focus()
{
    _ease = .15;
    _masterTarget = 0;
}

//Ease Values
masterVol = lerp(masterVol,_masterTarget,_ease);
musicVol = lerp(musicVol,_musicTarget,_ease);
sfxVol = lerp(sfxVol,_sfxTarget,_ease);
voiceVol = lerp(voiceVol,_voiceTarget,_ease);

//Update Audio
audio_master_gain(masterVol);
audio_group_set_gain(agMusic,musicVol);
audio_group_set_gain(agSfx,sfxVol);
audio_group_set_gain(agVoice,voiceVol);