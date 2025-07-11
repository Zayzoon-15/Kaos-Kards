


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
    attackWeight = _attackWeight;
    defendWeight = _defendWeight;
    diceWeight = _diceWeight;
}



///@self oEnemyAi
///@desc Adds an enemy card to the room
///@arg {string} _slot The slot name
///@arg {struct} _info The cards info
///@arg {real} _value The cards value
function enemyAddCard(_slot,_info,_value)
{
    //Get Slot Position
    var _slotId = layer_sprite_get_id("Slots",_slot);
    var _slotX = layer_sprite_get_x(_slotId);
    var _slotY = layer_sprite_get_y(_slotId);
    
    //Set Slot Size
    layer_sprite_xscale(_slotId,1.5);
    layer_sprite_yscale(_slotId,1.5);
    
    //Create Card
    instance_create_layer(_slotX,_slotY,"Cards",oEnemyCard,{
        info : _info,
        value : _value
    });
}
