
//Card Types
enum CARDTYPES {
	ACTION,
    DICE,
    KAOS
}

///@desc Creates the cards information
///@arg {string} _name The name of the card
///@arg {string} _desc The description of the card
///@arg {struct} _range The range of the card example: {min:1,max:3}. If there is no range put undefined
///@arg {real} _type The type of the card. This is an enum so use CARDTYPES
///@arg {Asset.GMSprite} _sprite The sprite of the card
///@arg {function} _action The function to preform when the card is used
///@arg {real} _destroyTime The amount to time till it destroys itself (Defualt = 60)
///@arg {struct} _diceType The type of dice it uses (ONLY FOR DICE CARDS)
function createCard(_name,_desc,_range,_type,_sprite,_action = function(){},_destroyTime = 60,_diceType = undefined) constructor{
    
    name = _name;
    desc = _desc;
    range = _range;
    type = _type;
    sprite = _sprite;
    action = _action;
	destroyTime = _destroyTime;
    diceType = _diceType;
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
    extraAgrs = _extraArgs;
    
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
    extraAgrs = _extraArgs;
    
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
    extraAgrs = _extraArgs;
    
    //Set Type
    type = CARDTYPES.DICE;
}