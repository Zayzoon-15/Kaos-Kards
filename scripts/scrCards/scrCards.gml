
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