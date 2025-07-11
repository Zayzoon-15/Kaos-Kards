

///@desc Creates the cards information
///@arg {string} _name The name of the card
///@arg {string} _desc The description of the card
///@arg {struct} _range The range of the card example: {min:1,max:3}. If there is no range put undefined
///@arg {real} _type The type of the card. This is an enum so use CARDTYPES
///@arg {Asset.GMSprite} _sprite The sprite of the card
///@arg {function} _action The function to preform when the card is used (DONT USE FOR DICE CARDS)
function createCard(_name,_desc,_range,_type,_sprite,_action = function(){}) constructor{
    
    name = _name;
    desc = _desc;
    range = _range;
    type = _type;
    sprite = _sprite;
    action = _action;
    
}




///@self oCard
function diceCardSwapDice(_dice){
    
    //Can Place
    with oDice
    {
        if diceId == 3
        {
            if !rollDone then other.canPlace = true; else other.canPlace = false;
        }
    }
    
    //Swap Dice
    if state == CARDSTATE.PLACED
    {
        with oDice
        {
            if diceId == other.targetDice and dice != _dice
            {
                dice = _dice;
                diceJuice();
            }
        }
    } else { //Change Dice Back
        with oDice
        {
            if diceId == other.targetDice and dice != diceTypes.dice6 and other.wasOnSlot
            {
                dice = diceTypes.dice6;
                diceJuice();
                other.wasOnSlot = false;
            }
        }
    }
    
    //Can Grab
    if state == CARDSTATE.PLACED
    {
        with oDice
        {
            if diceId == 3
            {
                if rolling
                {
                    other.canMove = false;
                }
                
                if rollDone
                {
                    other.slot.used = true;
                    instance_destroy(other);
                    starEffect(other.x,other.y,10);
                }
            }
        }
    }

}