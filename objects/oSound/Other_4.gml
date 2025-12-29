///@desc Play Correct Songs

if room == rPrepare
{
	audioPlayGroupSong(global.musicGroups.bg,sgPrepare);
    
    //Secret Song (For Felx)
    if loopTimer == undefined
    {
        var _time = audio_sound_length(sgPrepare)*3;
        timeSourceCreate(_time,function(){
            audioPlayGroupSong(global.musicGroups.bg,sgPrepareExtended);
            loopTimer = undefined;
        })
    }
} else if time_source_exists(loopTimer) {
    time_source_destroy(loopTimer);
    loopTimer = undefined;
}

if room == rKaos
{
	audioPlayGroupSong(global.musicGroups.bg,sgKaos);
}

if room == rTournies
{
	audioPlayGroupSong(global.musicGroups.menu,sgKenu);
}