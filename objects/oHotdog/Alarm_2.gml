///@desc End Hotdog Action

//Destroy Guys
with oHotdogGuy
{
    effectStar(x,y,5,false);
    instance_destroy();
}

//Change Song
audioPlaySong(global.currentEnemy.customSong.kaos);

//End Action
eventKaosCardDone();

//Destroy Self
instance_destroy();