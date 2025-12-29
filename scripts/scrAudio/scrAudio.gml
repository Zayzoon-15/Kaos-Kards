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
    return audio_play_sound(_asset,0,false,1,0,_pitch);
    //audio_play_sound_at(_asset, _x, _y, 0, 1500, 100, 1, false, 0,  1,0,_pitch);
}


/// @desc Creates an audio sync group with the songs given
/// @param {array} _songs The songs to add to the sync group
/// @param {bool} [_loop] If the song should loop (Default = true)
/// @returns {id} The audio sync group
function audioCreateSyncGroup(_songs,_loop = true)
{
	var _audioGroup = audio_create_sync_group(_loop);
	
	for (var i = 0; i < array_length(_songs); ++i) {
	    audio_play_in_sync_group(_audioGroup,_songs[i]);
		audio_sound_gain(_songs[i],0);
	}
	
	return _audioGroup;
}

/// @desc Plays a song that is inside a sync group
/// @param {id.audiosyncgroup} _audioGroup The target sync group
/// @param {asset.GMSound} _targetSong The target song
/// @param {real} [_fadeTime] The fade time for the song (Default = 30)
function audioPlayGroupSong(_audioGroup,_targetSong,_fadeTime = 30)
{
    //Exit If Same Song
    if _targetSong == global.curSong and _targetSong != noone then exit;
    
	//Set Last Song
	global.lastSong = global.curSong;
	
	//Play Group Song
	if !audio_sync_group_is_playing(_audioGroup)
	{
		audio_start_sync_group(_audioGroup);
	}
	
	//Unpause Group Song
	if audio_sync_group_is_paused(_audioGroup)
	{
		audio_resume_sync_group(_audioGroup);
	}
    
    //Get Songs Gain
    var _gain = 1;
    if ds_map_exists(global.soundMixer,_targetSong)
    {
        _gain = global.soundMixer[? _targetSong];
    }
	
	//Fade Out Song
	audio_sound_gain(global.curSong,0,_fadeTime);
	
	//Fade In Song
	audio_sound_gain(_targetSong,_gain,_fadeTime);
	
	//Set Global Var
	global.curSong = _targetSong;
	global.curSongGroup = _audioGroup;
}

/// @desc Plays a song and fades out the last song
/// @param {asset.GMSound} _song The target Song
/// @param {bool} [_mixSongs] If the song should keep playing in the background (Default = false)
/// @param {real} [_fadeTime] The time it takes to fade a song out and in (Default = 60)
/// @param {bool} [_loop] If the song should loop (Default = true)
function audioPlaySong(_song,_mixSongs = false,_fadeTime = 60,_loop = true)
{	
    //Exit If Same Song
    if _song == global.curSong and _song != noone then exit;
    
    //Get Songs Gain
    var _gain = 1;
    if ds_map_exists(global.soundMixer,_song)
    {
        _gain = global.soundMixer[? _song];
    }
    
	//Fade Out Song
	audio_sound_gain(global.curSong,0,_fadeTime);
	
	//Stop Audio Group
	timeSourceCreate(_fadeTime,function(_curSong){
		if global.curSongGroup != noone and _curSong == global.curSong
		{
			audio_pause_sync_group(global.curSongGroup);
			global.curSongGroup = noone;
		}
	},[_song],time_source_units_frames);
	
    
	//Check If Song Is Playing
	if !_mixSongs then audio_stop_sound(_song);
    
	//Play Song
	if _song != noone
    {
        audio_play_sound(_song,10,_loop);
    }
    
	//Fade In Song
	audio_sound_gain(_song,0);
	audio_sound_gain(_song,_gain,_fadeTime);
	
	//Set Global Var
    global.lastSong = global.curSong;
	global.curSong = _song;
}