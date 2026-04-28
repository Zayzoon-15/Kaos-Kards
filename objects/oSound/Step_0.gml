//Song Loop
if audio_is_playing(global.curSongAudio) and global.curSong != noone
{
    if global.songTracks[? global.curSong].loopTimes > 0
    {
        loopSongPoint = audio_sound_get_track_position(global.curSongAudio);
        if loopSongPoint >= audio_sound_length(global.curSongAudio)-.03
        {
            loops ++;
            
            if loops >= global.songTracks[? global.curSong].loopTimes
            {
                //Get Song
                var _song = global.songTracks[? global.curSong].swapWith;
                if is_array(_song)
                {
                    var _num = irandom_range(0,array_length(_song)-1);
                    _song = global.songTracks[? global.curSong].swapWith[_num];
                }
                
                //Add To Intros Played
                if global.songTracks[? global.curSong].isIntro
                {
                    ds_list_add(global.songIntrosPlayed,global.curSong);
                }
                
                //Play Song
                audioPlaySong(_song,0);
            }
            
            //Debug
            if showSongs
            {
                createAlertMessage("SONG LOOPED");
            }
        }
    }

    //Debug
    if showSongs
    {
        print("SONG POS",audio_sound_get_track_position(global.curSongAudio));
        print("SONG LENGTH",audio_sound_length(global.curSongAudio)-.02);
    }
}