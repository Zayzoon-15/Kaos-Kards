//Can't Combo
if global.playerComboMeter < 100 then exit;

//Check All Action Slots
cards = [];
with oActionSlot { 
    if filled then array_push(other.cards,card);
}

//Check If Same Cards
if array_length(cards) >= 3
{
    //Function To Check
    var _checkSame = function(_value,_index)
    {
        if !instance_exists(_value)
        {
            return  false;
        } else return _value.info == cards[0].info;
    }
    
    //All Same
    canCombo = array_all(cards,_checkSame);
} else canCombo = false;


//Create Combo Button
if canCombo and !instance_exists(oComboButton)
{
    instance_create_layer(640,480,"Buttons",oComboButton);
}