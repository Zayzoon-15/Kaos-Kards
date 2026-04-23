//DEBUG
if global.currentTourney == undefined
{
    global.currentTourney = tourneyInfo.debut;
}

//Setup
info = global.currentTourney.enemies[global.tourneyEnemiesBeaten];
sprite_index = info.sprite;
Enemy.SetupAnims(true,info,object_index);

//Change Song For Now
audioPlaySong(noone);