/// @desc Create the enemies fighting strategy
/// @param {real} [_healWeight] How important healing is (Default = 80)
/// @param {real} [_healVal] When should it consider healing (Default = 60)
/// @param {real} [_defendWeight] How important defending is (Default = 50)
/// @param {real} [_defendValue] When should it consider defending (Default = 50)
/// @param {real} [_diceWeight] How important the dice are if low a kaos card will be placed (Default = 80)
/// @param {real} [_diceVal] How many low dice before upgrading (Default = 2)
/// @param {real} [_comboWeight] How important it is to combo (Default = 100)
/// @param {real} [_specialWeight] How important it is to use the special move (Default = 40)
/// @param {real} [_specialVal] How many rounds in before using special move (Default = 3)
/// @param {real} [_specialUses] How many uses before they stop completely (Default = 2)
function enemyCreateStrat(_healWeight = 80,_healVal = 60,_defendWeight = 50,_defendValue = 50,_diceWeight = 80,_diceVal = 2,_comboWeight = 100,_specialWeight = 40,_specialVal = 3,_specialUses = 2) constructor 
{
    //Weights
    healWeight = _healWeight;
    defendWeight = _defendWeight;
    diceWeight = _diceWeight;
    comboWeight = _comboWeight;
    specialWeight = _specialWeight;
    
    //Values
    healValue = _healVal;
    defendValue = _defendValue;
    diceValue = _diceVal;
    specialValue = _specialVal;
    specialUses = _specialUses;
}

/// @desc Creates the enemies animation info
/// @param {real} [_idle] The amount of frames the idle animation has (Default = 2)
/// @param {real} [_hurt] The amount of frames the hurt animation has (Default = 2)
/// @param {real} [_win] The amount of frames the win animation has (Default = 2)
/// @param {real} [_death] The amount of frames the death animation has (Default = 2)
/// @returns {struct} The animation info
function enemyCreateAnims(_idle = 2,_hurt = 2,_win = 2,_death = 2) {
    //Create Clips
    var _clip = function(_length,_start=0,_loop = true)
    {
        return {
            start : _start,
            length : _length,
            loop : _loop,
        };
    }
    
    //Create Info
    var _info = { 
        idle : _clip(_idle),
        hurt : _clip(_hurt),
        win : _clip(_win),
        death: _clip(_death),
    }
    
    //Set Offsets
    var _order = ["idle","hurt","win","death"];
    var _offset = 0;
    
    for (var i = 0; i < array_length(_order); i++)
    {
        var _key = _order[i];
        var _anim = struct_get(_info, _key);
        
        _anim.start = _offset;
        _offset += _anim.length;
        
        struct_set(_info, _key, _anim);
    }
    
    //Return Animation Info
    return _info;
}

/// @desc Creates the enemies information
/// @param {string} _name The name of the enemy
/// @param {Asset.GMSprite} _sprite The sprite of the enemy
/// @param {struct.enemycreateanims} [_animInfo] The animation info for the enemies sprite
/// @param {array} _actionCards The enemies action cards (Example: [actionCards.bread, actionCards.heal])
/// @param {array} _kaosCards The enemies kaos cards (Example: [kaosCards.swoop])
/// @param {struct.enemycreatestrat} [_strat] The enemies figthing strategy
/// @param {any*} [_special] The enemies special move(leave as undefined if they don't use one)
function enemyCreate(_name,_sprite,_animInfo = enemyCreateAnims(),_actionCards,_kaosCards,_strat = new enemyCreateStrat(),_special = undefined) constructor
{    
    //Info
    name = _name;
    sprite = _sprite;
    animInfo = _animInfo;
    special = _special;
    
    //Cards
    cardsAct = _actionCards;
    cardsKaos = _kaosCards;
    
    //Strat
    strat = _strat;
}



///@self oEnemyAi
///@desc Adds an enemy card to the room
///@arg {real} _slotId The slot id
///@arg {struct} _info The cards info
///@arg {real} _value The cards value
///@arg {bool} _used If the slot is used
///@arg {bool} _disabled If the slot is disabled
function enemyAddCard(_slotId,_info,_value,_used = false,_disabled = false)
{
    //Get Inst
    var _slotInst = _slotId != 0 ? oActionSlot : oSpecialSlot;

    //Get Pos
    var _x, _y;
    switch (_slotId) {
    	case 0: _x = 160; _y = 512; break;
    	case 1: _x = 440; _y = 360; break;
    	case 2: _x = 640; _y = 360; break;
    	case 3: _x = 840; _y = 360; break;
    }
    
    //Skipped
    if !_used and !_disabled and _info == undefined
    {
        global.enemyComboMeter += irandom_range(3,4);
    }

    //Create Slot
    var _slot = instance_create_layer(_x,_y,"Slots",_slotInst,{slotId : _slotId,});
    _slot.used = _used; //Set Used
    _slot.disabled = _disabled; //Set Disabled
    
    //Create Card
    if !_used 
    {
        instance_create_layer(_x,_y,"Cards",oEnemyCard,{
            info : _info,
            value : _value,
            slotId : _slotId,
			slot : _slot
        });
    }
}

