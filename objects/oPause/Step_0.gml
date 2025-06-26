
//Layer Fx
effectLayer = layer_get_id("PauseFx");

if global.gamePaused
{
    instance_activate_layer(effectLayer);
    layer_set_visible(effectLayer,true);
} else layer_set_visible(effectLayer,false);


//Stop Everything
if global.gamePaused
{
    instance_deactivate_all(true);
    instance_activate_object(oGame);
    instance_activate_object(oMusicGame);
    instance_activate_object(oMusicMenu);
    instance_activate_object(oMusicManager);
    instance_activate_object(oSoundTray);
} else instance_activate_all();


//Temp
if global.gamePaused and room == rEnemyRoom
{
    layer_set_visible("Text",false);
    layer_set_visible("Stuff",false);
} else { 
    layer_set_visible("Text",true);
    layer_set_visible("Stuff",true);
}

if !global.midTrans and room != rMainMenu and room != rEnemySelect and room != rCredits and room != rTutorial and gamestate != GAMESTATE.PLAYERWIN and gamestate != GAMESTATE.PLAYERLOSS
{
    canPause = true;
} else canPause = false;