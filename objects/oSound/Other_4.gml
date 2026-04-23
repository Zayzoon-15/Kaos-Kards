///@desc Play Correct Songs

if room == rPrepare
{
    //Set Enemy If None
    if global.currentEnemy == undefined {
        print("NO ENEMY WAS CHOSEN");
        global.currentEnemy = enemyInfo.dog;
    }
    
    audioPlaySong(global.currentEnemy.customSong.prepare);
}

if room == rKaos
{
    audioPlaySong(global.currentEnemy.customSong.kaos);
}

if room == rTournies
{
    audioPlaySong("Menu");
}