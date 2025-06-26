//Create Menu Music
if room == rMainMenu or room == rEnemySelect
{
    if !instance_exists(oMusicMenu)
    {
        instance_create_layer(0,0,"Ui",oMusicMenu);
    }
}

//Create Game Music
if room == rPlayerRoom or room == rChaosRoom or room == rEnemyRoom
{
    if !instance_exists(oMusicGame) and (gamestate != GAMESTATE.PLAYERLOSS or gamestate != GAMESTATE.PLAYERWIN)
    {
        instance_create_layer(0,0,"Ui",oMusicGame);
    }
}