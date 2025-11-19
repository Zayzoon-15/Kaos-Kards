///@desc Set Audio

//Set Targets
var _ease = .3;
var _masterTarget = global.masterVol/100;
var _musicTarget = 0//global.musicVol/200;
var _sfxTarget = global.sfxVol/40;

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

//Update Audio
audio_master_gain(masterVol);
audio_group_set_gain(agMusic,musicVol);
audio_group_set_gain(agSfx,sfxVol);