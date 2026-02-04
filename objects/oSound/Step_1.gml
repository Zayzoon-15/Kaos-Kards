///@desc Set Audio

//Set Targets
var _ease = .3;
var _masterTarget = global.masterVol/100;
var _musicTarget = global.musicVol/200;
var _sfxTarget = global.sfxVol/40;
var _voiceTarget = global.voiceVol/20;

//Unfocus Mute
if global.unfocusMute and !window_has_focus()
{
    _ease = .15;
    _masterTarget = 0;
}

//Ease Values
masterVol = lerp_dt(masterVol,_masterTarget,_ease);
musicVol = lerp_dt(musicVol,_musicTarget,_ease);
sfxVol = lerp_dt(sfxVol,_sfxTarget,_ease);
voiceVol = lerp_dt(voiceVol,_voiceTarget,_ease);

//Update Audio
audio_master_gain(masterVol);
audio_group_set_gain(agMusic,musicVol);
audio_group_set_gain(agSfx,sfxVol);
audio_group_set_gain(agVoice,voiceVol);