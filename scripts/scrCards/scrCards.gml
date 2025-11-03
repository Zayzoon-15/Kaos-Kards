
//Card Types
enum CARDTYPES {
	ACTION,
    DICE,
    KAOS
}


/// @desc Creates an action card
/// @param {string} _name The cards names
/// @param {string} _desc The cards description
/// @param {asset.GMSprite} _sprite The cards sprite
/// @param {array} _range The cards range Ex: [1,6] min-1 max-6
/// @param {function} _action The cards action (Put undefined of it has no action)
/// @param {array} _extraArgs Extra arguments the givin function can use
function createCardAction(_name,_desc,_sprite,_range,_action = undefined,_extraArgs = []) constructor
{
    //Info
    name = _name;
    desc = _desc;
    sprite = _sprite;
    
    //Set Range
    range = { 
        min : _range[0],
        max : _range[1]
    };
    
    //Get Action
    var _func = _action;
    if _action == undefined then _func = function(){};
    
    //Set Action
    action = _func;
    extraArgs = _extraArgs;
    
    //Set Type
    type = CARDTYPES.ACTION;
}


/// @desc Creates a kaos card
/// @param {string} _name The cards names
/// @param {string} _desc The cards description
/// @param {asset.GMSprite} _sprite The cards sprite
/// @param {function} _action The cards action (Put undefined of it has no action)
/// @param {array} _extraArgs Extra arguments the givin function can use
function createCardKaos(_name,_desc,_sprite,_action = undefined,_extraArgs = []) constructor
{
    //Info
    name = _name;
    desc = _desc;
    sprite = _sprite;
    range = undefined;
    
    //Get Action
    var _func = _action;
    if _action == undefined then _func = function(){};
    
    //Set Action
    action = _func;
    extraArgs = _extraArgs;
    
    //Set Type
    type = CARDTYPES.KAOS;
}


/// @desc Creates a dice card
/// @param {string} _name The cards names
/// @param {string} _desc The cards description
/// @param {asset.GMSprite} _sprite The cards sprite
/// @param {function} _action The cards action (Put undefined of it has no action)
/// @param {array} _extraArgs Extra arguments the givin function can use
/// /// @param {array} _range The cards range Ex: [1,6] min-1 max-6
function createCardDice(_name,_desc,_sprite,_action = function(){},_extraArgs = [],_range = []) constructor
{
    //Info
    name = _name;
    desc = _desc;
    sprite = _sprite;
    
    //Set Range
    if array_length(_range) > 0
    {
        range = {
            min : _range[0],
            max : _range[1]
        }
    } else range = undefined;
    
    //Get Action
    var _func = _action;
    if _action == undefined then _func = function(){};
    
    //Set Action
    action = _func;
    extraArgs = _extraArgs;
    
    //Set Type
    type = CARDTYPES.DICE;
}