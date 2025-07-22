


///@desc Creates the enemies information
///@arg {string} _name The name of the enemy
///@arg {Asset.GMSprite} _sprite The sprite of the enemy
///@arg {array} _attacks The enemies attack cards (Example: [actionCards.bread, actionCards.slash])
///@arg {array} _kaos The enemies kaos cards (Example: [kaosCards.swoop])
///@arg {real} _healWeight How important healing is (Default = 100)
///@arg {real} _defendWeight How important defending is (Default = 30)
///@arg {real} _diceWeight How important the dice are (Default = 80)
///If dice weight is low a kaos card will be placed
function createEnemy(_name,_sprite,_attacks,_kaos,_healWeight = 100, _defendWeight = 30, _diceWeight = 80) constructor{
    
    name = _name;
    sprite = _sprite;
    attacks = _attacks;
    kaos = _kaos;
    healWeight = _healWeight;
    defendWeight = _defendWeight;
    diceWeight = _diceWeight;
}



///@self oEnemyAi
///@desc Adds an enemy card to the room
///@arg {real} _slotId The slot id
///@arg {struct} _info The cards info
///@arg {real} _value The cards value
///@arg {bool} _used If the slot is used
function enemyAddCard(_slotId,_info,_value,_used = false)
{
    //Get Inst
    var _slotInst = oActionSlot;
    if _slotId == 0 then _slotInst = oSpecialSlot;

    //Get Pos
    var _x, _y;
    switch (_slotId) {
    	case 0: _x = 160; _y = 512; break;
    	case 1: _x = 440; _y = 360; break;
    	case 2: _x = 640; _y = 360; break;
    	case 3: _x = 840; _y = 360; break;
    }
    
    //Create Slot
    var _slot = instance_create_layer(_x,_y,"Slots",_slotInst,{slotId : _slotId,});
    _slot.used = _used; //Set Used
    _slot.scale = 1.3; //Set Size;
    
    //Create Card
    if !_used 
    {
        instance_create_layer(_x,_y,"Cards",oEnemyCard,{
            info : _info,
            value : _value,
            slotId : _slotId
        });
    }
}