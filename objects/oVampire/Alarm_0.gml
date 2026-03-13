///@desc Activate Card

//Done
if targetSlotId > 3
{
    effectStar(x,y,10,true,20,25);
    instance_destroy();
    timeSourceCreate(30,allCardValuesGained,[],time_source_units_frames);
    exit;
}

//Get Slots
var _card = noone;
with oActionSlot
{
    if slotId == other.targetSlotId
    {
        //Slot Empty
        if !filled and !disabled
        {
            instance_create_layer(x,bbox_top,"Effects",oEffectSkipped);
            scale += .3;
            used = true;
            exit;
        } 
        
        //Get Card
        _card = card;
    }
}

//Start Again
targetSlotId += 1;
alarm[0] = 30;

//Check Card
if _card == noone then exit;

//Add Range
with _card
{
    //Juice
    cardJuice();
    audioPlaySfx(snCardValue,.95,1.05);
    
    //Text Effect
    effectNumber(x,bbox_top,other.values[other.targetSlotId-2]);
    
    //Change Range
    currentValue += other.values[other.targetSlotId-2];
}