#region Player

///@desc Adds the players actions to a list
///@arg {Asset.GMObject} _card The card inst
function addPlayerAction(_card)
{
    //Create Struct
    var _struct;
    with _card
    {
        _struct = {
            info : info,
            value : currentValue
        };
    }
    
    //Add To List
    ds_list_set(playerActions,_card.slot.slotId-1,_struct);
}


///@desc Adds the players kaos to a variable
///@arg {Asset.GMObject} _card The card inst
function addPlayerKaos(_card)
{
    
    //Create Struct
    var _struct;
    with _card
    {
        _struct = {
            info : info,
            value : currentValue
        };
    }
    
    //Add To List
    playerKaos = _struct;
}

#endregion


#region Enemy

///@desc Adds the enemies actions to a list
///@arg {struct} _info The cards information
///@arg {real} _value The cards value
///@arg {real} _pos The cards position
function addEnemyAction(_info,_value,_pos)
{
    //Create Struct
    var _struct;
    _struct = {
        info : _info,
        value : _value
    }
    
    //Add To List
    ds_list_set(enemyActions,_pos,_struct);
}

///@desc Adds the enemies kaos to a variable
///@arg {struct} _info The cards information
function addEnemyKaos(_info)
{
    //Create Struct
    var _struct;
    _struct = {
        info : _info,
        value : undefined
    }
    
    //Add To List
    enemyKaos = _struct;
}

#endregion
