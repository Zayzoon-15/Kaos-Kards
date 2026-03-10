///@desc Play Correct Songs

if room == rPrepare
{
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