///@desc Slot Called

//Slot Empty
if !filled and !disabled
{
    instance_create_layer(x,bbox_top,"Effects",oEffectSkipped);
    scale += .3;
    used = true;
} 

//Start Dice
if slotId == 3
{
    with oDice
    {
        combineValues();
    }
    
    //Start Dice Cards
    with oCard
    {
        if state == CARDSTATE.PLACED and info.type == CARDTYPES.DICE
        {
            alarm[1] = 30;
        }
    }
}