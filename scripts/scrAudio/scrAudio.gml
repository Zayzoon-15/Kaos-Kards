//Functions that have to do with audio



///@desc Plays a sound effect
///The pitch of this sound can be changed
///@param {Asset.GMSound} _sound The sound asset (Can be an array of sounds)
///@param {real} [_low] The lowest the pitch can be (Default = 1)
///@param {real} [_high] The highest the pitch can be (Default = 1)
///@param {real} _gain The gain of the sound (Default = 1)
function audioPlaySfx(_sound,_low = 1,_high = 1,_gain = 1)
{
    //Get Pitch
    var _pitch = random_range(_low,_high);
    
    //Get Sound Asset
    var _asset = _sound;
    if is_array(_sound)
    {
        _asset = array_get_random(_sound);
    }
    
    //Play Sound
    return audio_play_sound(_asset,0,false,_gain,0,_pitch);
    //audio_play_sound_at(_asset, _x, _y, 0, 1500, 100, 1, false, 0,  1,0,_pitch);
}


///@desc Plays the announcers voice line with subtitles
///@param {struct.voicecreate} _voiceover The voice over to play (Make sure its a voiceInfo in order to create subtitles)
///@param {bool} _stopOthers If set to true it will stop the other voice and play the new one but if it's set to false it will only play the new voice if there is no voices playing (Default = true)
///@param {real} _playChance The chance the audio plays 1 in X (Default = 1) which is always
function audioPlayVoice(_voiceover,_stopOthers = true,_playChance = 1)
{
    //No Voice Over
    if !global.voiceover then return noone;
    
    //Play Chance
    if irandom_range(1,_playChance) != 1 then return noone;
    
    //Stop Other Voice
    if _stopOthers
    {
        audio_group_stop_all(agVoice);
    } else if global.voicePlaying then return noone;
    
    
    //Get Voice Info
    var _voice = _voiceover;
    if is_array(_voiceover)
    {
        _voice = array_get_random(_voiceover);
    }
    
    //Create Subtitle
    instance_destroy(oSubtitle);
    instance_create_depth(0,0,-1,oSubtitle,{info : _voice});
    
    //Play Sound
    return audio_play_sound(_voice.sound,0,false);
}


/// @desc Creates a song (ONLY USE INSIDE SOUND OBJECT)
/// @param {string} _name The song name
/// @param {Asset.GMSound} _sound The sound to play
/// @param {array} [_syncWith] The songs this song can sync with (put [] if none)
/// @param {real} [_volume] The songs volume
/// @param {real} [_loopTimes] How many times to loop the song before swaping it with another song (leave as -1 if it does not swap)
/// @param {string } [_sawpWith] The song to swap with
function audioCreateSongs(_name,_sound,_syncWith=[],_volume = 1,_loopTimes = -1,_sawpWith = noone,_isIntro = false,_playOnce = true) 
{
    var _info = {
        name : _name,
        sound : _sound,
        syncWith : _syncWith,
        volume : _volume,
        loopTimes : _loopTimes,
        swapWith : _sawpWith,
        isIntro : _isIntro
    }

    global.songTracks[? _name] = _info;
}


/// @desc Plays a song
/// @param {string} _song The song to play (Make sure it has been created)
/// @param {real} [_fadeTime] The fade time for the song (Default = 30)
/// @param {string} [_lastSongEndMethod] What the song method for the last song should be ("Stop" to stop the song completely, "Pause" to pause the song ) (Default = "Stop")
function audioPlaySong(_song,_fadeTime = 30,_lastSongEndMethod = "Stop")
{
    //Change Song If Intro
    if ds_map_exists(global.songTracks,_song) and global.songTracks[? _song].isIntro and ds_list_contains_value(global.songIntrosPlayed,_song)
    {
        //Get Song
        var _targetSong = global.songTracks[? _song].swapWith;
        if is_array(_targetSong)
        {
            var _num = irandom_range(0,array_length(_targetSong)-1);
            _targetSong = global.songTracks[? _song].swapWith[_num];
        }
        
        //Set Song
        _song = _targetSong;
    }
    
    //Exit If Same Song
    if _song == global.curSong and audio_is_playing(global.curSongAudio) then exit;
    
    with oSound {
    	loops = 0;
        loopSongPoint = 0;
    }
    
    //Set Global Vars
    global.lastSong = global.curSong;
    global.curSong = _song;
    
	//Fade Out Last Song
    if ds_map_exists(global.songTracks,global.lastSong)
    {
        global.lastSongAudio = global.curSongAudio;
    	audio_sound_gain(global.lastSongAudio,0,_fadeTime);
        
        //Song Tracker Already Exists
        with oSongTracker {
        	if targetSong == global.lastSongAudio then instance_destroy();
        }
        
        //Create Song Tracker
        instance_create_depth(0,0,0,oSongTracker,{
            targetSong : global.lastSongAudio,
            songInfo : global.songTracks[? global.lastSong],
            endMethod : _lastSongEndMethod
        });
    }
    
    //Leave If No Song
    if _song == noone or !ds_map_exists(global.songTracks,_song) then exit;
    
    //Get Track
    var _track = global.songTracks[? _song];
    
    //Song Paused
    if audio_is_paused(_track.sound)
    {
        //Set Current Song
        global.curSongAudio = global.songsPaused[? _track.name]; 
        
        //Resume
        audio_resume_sound(global.curSongAudio);
        
        //Remove From Paused Map
        ds_map_delete(global.songsPaused,_track.name);
        
    } else global.curSongAudio = audio_play_sound(_track.sound,10,true); //Play Song
    
    //Fade In Song
    audio_sound_gain(global.curSongAudio,0,0);
    audio_sound_gain(global.curSongAudio,_track.volume,_fadeTime);
    
    //Sync Songs
    if ds_map_exists(global.songTracks,global.lastSong) and array_contains(_track.syncWith,global.lastSong)
    {
        var _pos = audio_sound_get_track_position(global.lastSongAudio);
        audio_sound_set_track_position(global.curSongAudio,_pos);
    }
}