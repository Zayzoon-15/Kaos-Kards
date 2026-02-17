///@desc Action

//Combo
if combo
{
    //Reduce Combo Meter
    if targetEnemy
    {
        global.playerComboMeter = 0;
    } else global.enemyComboMeter = 0;
    
    //Preform Combo
    if cardId == 1
    {
        //Arguments
        var _args = array_concat([targetEnemy],card.info.comboArgs);
        
        //Do Action
        method_call(card.info.comboAction,_args);
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
ds_debug_print(global.gamelog,ds_type_list);

//Increase Repeated
repeatedTimes ++;

//Repeat
if global.repeatTimes >= repeatedTimes and card.info.type == CARDTYPES.ACTION
{
    alarm[0] = 60;
}