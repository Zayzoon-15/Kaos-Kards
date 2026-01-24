
//Card Types
enum CARDTYPES {
	ACTION,
    DICE,
    KAOS
}

//Card Genres
enum CARDACT_GENRES {
	HEAL,
    DEFEND,
    ATTACK
}


/// @desc Creates an action card
/// @param {string} _name The cards names
/// @param {string} _desc The cards description
/// @param {asset.GMSprite} _sprite The cards sprite
/// @param {array} _range The cards range Ex: [1,6] min-1 max-6
/// @param {Enum} _genre The card genre
/// @param {function} _action The cards action (Put undefined of it has no action)
/// @param {array} _extraArgs Extra arguments the givin function can use
/// @param {function} _comboAction The cards combo action (Put undefined of it has no action)
/// @param {array} _comboArgs Extra arguments the givin combo function can use
function createCardAction(_name,_desc,_sprite,_range,_genre = CARDACT_GENRES.ATTACK,_action = undefined,_extraArgs = [],_comboAction = undefined,_comboArgs = []) constructor
{
    //Info
    name = _name;
    desc = _desc;
    sprite = _sprite;
    uses = NaN;
    date = $"{current_month}/{current_day}/{current_year}/{current_second}";
    
    //Set Range
    range = { 
        min : _range[0],
        max : _range[1]
    };
    
    //Get Action
    var _funcAction = _action == undefined ? function(){} : _action;
    var _funcCombo = _comboAction == undefined ? function(){} : _comboAction;
    
    //Set Action
    action = _funcAction;
    extraArgs = _extraArgs;
    comboAction = _funcCombo;
    comboArgs = _comboArgs;
    
    //Set Type
    type = CARDTYPES.ACTION;
    genre = _genre;
    
    //Placement
    //Mainly just to be able to order the cards based on the struct :P
    global.deckPlacementId ++;   
    placementId = global.deckPlacementId;
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
    uses = NaN;
    date = $"{current_month}/{current_day}/{current_year}/{current_second}";
    
    //Get Action
    var _func = _action;
    if _action == undefined then _func = function(){};
    
    //Set Action
    action = _func;
    extraArgs = _extraArgs;
    
    //Set Type
    type = CARDTYPES.KAOS;
    
    //Placement
    //Mainly just to be able to order the cards based on the struct :P
    global.deckPlacementId ++;   
    placementId = global.deckPlacementId;
}


/// @desc Creates a dice card
/// @param {string} _name The cards names
/// @param {string} _desc The cards description
/// @param {asset.GMSprite} _sprite The cards sprite
/// @param {function} _action The cards action (Put undefined of it has no action)
/// @param {real} _uses The amount of times the card can be used before not being able to use again (put Nan if infinite)
/// @param {array} _extraArgs Extra arguments the givin function can use
/// /// @param {array} _range The cards range Ex: [1,6] min-1 max-6
function createCardDice(_name,_desc,_sprite,_action = function(){},_uses = NaN,_extraArgs = [],_range = []) constructor
{
    //Info
    name = _name;
    desc = _desc;
    sprite = _sprite;
    uses = _uses;
    date = $"{current_month}/{current_day}/{current_year}/{current_second}";
    
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
    
    //Placement
    //Mainly just to be able to order the cards based on the struct :P
    global.deckPlacementId ++;   
    placementId = global.deckPlacementId;
}