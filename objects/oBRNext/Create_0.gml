//DEBUG
if global.currentTourney == undefined
{
    global.currentTourney = tourneyInfo.debut;
}

//Setup
info = global.currentTourney.enemies[global.tourneyEnemiesBeaten];
sprite_index = info.sprite;
anim = new animManager(info);
anim.play("idle");