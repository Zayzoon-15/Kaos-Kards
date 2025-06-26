//Make Sure Song Is Playing
if !audio_sync_group_is_playing(gameMusic)
{
    audio_start_sync_group(gameMusic);
}


//Prepare
if gamestate == GAMESTATE.PREPARE
{
    audio_sound_gain(sgBeforeChaos,1,transTime);
    audio_sound_gain(sgTheKaos,0,transTime);
}

//Kaos
if gamestate == GAMESTATE.KAOS
{
    audio_sound_gain(sgBeforeChaos,0,transTime);
    audio_sound_gain(sgTheKaos,1,transTime);
}

//Game Over
if gamestate == GAMESTATE.PLAYERWIN or gamestate == GAMESTATE.PLAYERLOSS
{
    audio_sound_gain(sgBeforeChaos,0,transTime);
    audio_sound_gain(sgTheKaos,0,transTime);
}

//Return To Menu
if gamestate == GAMESTATE.MENUS
{
    audio_sound_gain(sgBeforeChaos,0,transTime);
    audio_sound_gain(sgTheKaos,0,transTime);
}

//Delete Group
if audio_sound_get_gain(sgBeforeChaos) <= 0 and audio_sound_get_gain(sgTheKaos) <= 0
{
    audio_stop_sync_group(gameMusic);
    audio_destroy_sync_group(gameMusic);
    instance_destroy();
}