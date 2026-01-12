//Secret Song (For Felx)
if room == rPrepare
{
    prepareTimer += delta_time / 1000000; // seconds

    var _length = audio_sound_length(global.curSong);

    if prepareTimer >= _length
    {
        prepareTimer = 0;
        prepareLoopCount++;
        
        //Play Secret Song
        if prepareLoopCount >= 3
        {
            if global.curSong == sgPrepare
            {
                audioPlayGroupSong(global.musicGroups.bg,sgPrepareExtended);
            } else if global.curSong == sgPrepareExtended {
                audioPlayGroupSong(global.musicGroups.bg,sgPrepare);
                
                prepareLoopCount = 0;
                prepareTimer = 0;
            }
        }
    }
} else {
    prepareTimer = 0;
    prepareLoopCount = 0;
}