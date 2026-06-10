///@desc Action

if disabled then exit;

//Combo
if combo
{
    //Reduce Combo Meter
    if targetEnemy
    {
        global.playerComboMeter = 0;
    } else global.enemyComboMeter = 0;
    
    //Set Shake
    cardSetShake(6,.02);
    
    //Sound
    audio_stop_sound(snComboTick);
    if !audio_is_playing(snComboUsed) then audioPlaySfx(snComboUsed);
    
    //Preform Combo
    if cardId == 1
    {
        //Do Action
        alarm[1] = 140;
    }
    
    //Exit Code
    exit;
}

//Arguments
var _args = array_concat([targetEnemy],card.info.extraArgs);

//Do Action
method_call(card.info.action,_args);

//Reduce Uses
if card.info.uses != NaN
{
    if targetEnemy
    {
        array_push(global.cardUses.player,card.info.name);
    } else array_push(global.cardUses.enemy,card.info.name);
}

//Add To Log
ds_list_add(global.gamelog,card.info.name);

//Increase Repeated
repeatedTimes ++;

//Repeat
if global.repeatTimes >= repeatedTimes and card.info.type == CARDTYPES.ACTION
{
    alarm[0] = 100;
}