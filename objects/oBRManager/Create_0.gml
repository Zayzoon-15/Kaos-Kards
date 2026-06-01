//Play Song
audioPlaySong("BreakRoomIntro");

//Beat Enemy Prior
beatEnemy = global.currentTourney.enemies[0] != global.currentTourney.enemies[global.tourneyEnemiesBeaten] and !global.gaveReward;

//Destroy Items
alarm[0] = 1;

//Give Player Rewards
if beatEnemy
{
    //Create Menu
    instance_create_layer(0,0,"Ui",oReward,{
        cards : global.currentTourney.enemies[global.tourneyEnemiesBeaten-1].rewards
    });
    
    //Set Global Var
    global.gaveReward = true;
}