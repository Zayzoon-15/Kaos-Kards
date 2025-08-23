

//Reduce Shield
if room == rMain
{
    var _reduceAmount = 20;
    global.playerTempHp -= _reduceAmount;
    global.enemyTempHp -= _reduceAmount;
    
    if array_length(global.playerEffects) > 0
    {
    	var _newValue = global.playerEffects[0].percent - _reduceAmount;
        var _newArray = {
            info : global.playerEffects[0].info,
            value : global.playerEffects[0].value,
            percent : _newValue
        };
        show_message(_newArray)
        array_insert(global.playerEffects,0,_newArray);
    }
}
