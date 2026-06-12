//Song Loop
if global.curSong != noone and global.curSongAudio != noone and global.curSong != undefined and global.curSongAudio != undefined
{
    var _curSong = global.songTracks[? global.curSong];
    
    //Song Ended
    if !audio_is_playing(global.curSongAudio) and !audio_is_paused(global.curSongAudio)
    {
        //Replay Song
        global.curSongAudio = audio_play_sound(_curSong.sound,10,false);
        
        //Song Has Limited Loops
        if _curSong.loopTimes > 0
        {
            //Increase Loops
            loops ++;
            
            //Switch Song Out
            if loops >= _curSong.loopTimes
            {
                //Get Song
                var _song = _curSong.swapWith;
                if is_array(_song)
                {
                    var _num = irandom_range(0,array_length(_song)-1);
                    _song = _curSong.swapWith[_num];
                }
                
                //Add To Intros Played
                if _curSong.isIntro
                {
                    ds_list_add(global.songIntrosPlayed,global.curSong);
                }
                
                print("Song Looped",global.curSong);
                print("Song Playing",_song);
                
                audioPlaySong(_song,0);
            }
            
            if showSongs
            {
                createAlertMessage("SONG LOOPED");
            }
        }
    }
}

//Remove Sound Effects
if global.sfxVol > 0 and global.masterVol > 0 and array_length(global.allSfx) > 0
{
    for (var i = 0; i < array_length(global.allSfx); i++) {

    	if !audio_is_playing(global.allSfx[i]) and !audio_is_paused(global.allSfx[i])
        {
            audio_stop_sound(global.allSfx[i]);
            array_delete(global.allSfx,i,1);
        }
    }
}
