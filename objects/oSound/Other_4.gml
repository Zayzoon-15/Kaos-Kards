///@desc Play Correct Songs

if room == rPrepare
{
    var _song = global.currentEnemy == undefined ? "Prepare" : global.currentEnemy.customSong[0];
    audioPlaySong(_song);
}

if room == rKaos
{
    var _song = global.currentEnemy == undefined ? "Kaos" : global.currentEnemy.customSong[1];
    audioPlaySong(_song);
}

if room == rTournies
{
    audioPlaySong("Menu");
}