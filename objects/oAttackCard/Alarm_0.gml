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