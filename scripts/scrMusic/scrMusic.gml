
function audioCreateSongs(_name,_sound,_syncWith=[],_volume = 1,_loopTimes = -1,_sawpWith = noone,_loop = true) 
{
    var _info = {
        name : _name,
        sound : _sound,
        syncWith : _syncWith,
        volume : _volume,
        loopTimes : _loopTimes,
        swapWith : _sawpWith,
        loop : _loop,
    }

    global.songTracks[? _name] = _info;
}


function audioPlaySong(_song,_fadeTime = 30,_lastSongEndMethod = "Stop")
{
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
    if _song == noone then exit;
    
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