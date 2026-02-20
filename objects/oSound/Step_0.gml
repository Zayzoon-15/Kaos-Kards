//Song Loop
if audio_is_playing(global.curSongAudio) and global.curSong != noone
{
    if global.songTracks[? global.curSong].loopTimes > 0
    {
        if loopSongPoint >= audio_sound_length(global.curSongAudio)-.01
        {
            loops ++;
            
            if loops >= global.songTracks[? global.curSong].loopTimes
            {
                audioPlaySong(global.songTracks[? global.curSong].swapWith,0);
            }
        }
        loopSongPoint = audio_sound_get_track_position(global.curSongAudio);
    }
}