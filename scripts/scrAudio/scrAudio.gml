//Functions that have to do with audio


///@desc Plays a sound effect
///The pitch of this sound can be changed
///@param {Asset.GMSound} _sound The sound asset (Can be an array of sounds)
///@param {real} [_low] The lowest the pitch can be (Default = 1)
///@param {real} [_high] The highest the pitch can be (Default = 1)
///@param {real} _x The x position to play the sound (Default = x)
///@param {real} _y The y position to play the sound (Default = y)
function audioPlaySfx(_sound,_low = 1,_high = 1,_x = x,_y = y)
{
    //Get Pitch
    randomise();
    var _pitch = random_range(_low,_high);
    
    //Get Sound Asset
    var _asset = _sound;
    if is_array(_sound)
    {
        _asset = array_get_random(_sound);
    }
    
    //Play Sound
    audio_play_sound(_asset,0,false,1,0,_pitch);
    //audio_play_sound_at(_asset, _x, _y, 0, 1500, 100, 1, false, 0,  1,0,_pitch);
}


function audioCreateSyncGroup(_songs = [],_loop = true)
{
	var _audioGroup = audio_create_sync_group(_loop);
	
	for (var i = 0; i < array_length(_songs); ++i) {
	    audio_play_in_sync_group(_audioGroup,_songs[i]);
		audio_sound_gain(_songs[i],0);
	}
	
	return _audioGroup;
}

function audioPlayGroupSong(_audioGroup,_targetSong,_fadeTime = 30)
{
	//Play Group Song
	if !audio_sync_group_is_playing(_audioGroup)
	{
		audio_start_sync_group(_audioGroup);
	}
	
	//Unpause Song
	if audio_sync_group_is_paused(_audioGroup)
	{
		audio_resume_sync_group(_audioGroup);
	}
	
	//Fade Out Song
	audio_sound_gain(global.curMusic,0,_fadeTime);
	
	//Fade In Song
	audio_sound_gain(_targetSong,1,_fadeTime);
	
	//Set Global Var
	global.curMusic = _targetSong;
	global.curMusicGroup = _audioGroup;
}

function audioPlaySong(_song,_mixSong = false,_fadeTime = 30,_loop = true)
{	
	//Fade Out Song
	audio_sound_gain(global.curMusic,0,_fadeTime);
	
	//Stop Audio Group
	timeSourceCreate(_fadeTime,function(_curSong){
		if global.curMusicGroup != noone and _curSong == global.curMusic
		{
			audio_pause_sync_group(global.curMusicGroup);
			global.curMusicGroup = noone;
		}
	},[_song],time_source_units_frames);
	
	//Check If Song Is Playing
	if !_mixSong then audio_stop_sound(_song);
	
	//Play Song
	if !audio_is_playing(_song) and _song != noone then audio_play_sound(_song,10,_loop);
	
	//Fade In Song
	audio_sound_gain(_song,0);
	audio_sound_gain(_song,1,_fadeTime);
	
	//Set Global Var
	global.curMusic = _song;
}