///@desc Play Correct Songs

if room == rPrepare
{
    //Set Enemy If None
    if global.currentEnemy == undefined {
        print("NO ENEMY WAS CHOSEN");
        global.currentEnemy = enemyInfo.dog;
    }
    
    //Dont Play Song
    if global.currentTourney != undefined and global.gameRound <= 1 then exit;
    
    //Play Prepare
    audioPlaySong(global.currentEnemy.customSong.prepare);
    
}

if room == rKaos
{
    audioPlaySong(global.currentEnemy.customSong.kaos);
}

if room == rTournies or room == rTourneySelector
{
    audioPlaySong("Menu");
}