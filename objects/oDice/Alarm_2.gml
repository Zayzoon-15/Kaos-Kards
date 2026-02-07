///@desc Go To Slot

//Set State
state = diceStates.combine;

//Skipped
if targetSlot == undefined { 
    
    skipped = true;
    
    //Give Combo
    if !global.disabledSlots.player[diceId]
    {
        global.playerComboMeter += irandom_range(3,4);
    }
    
    //Animate
    instance_create_layer(x,bbox_top,"Effects",oEffectSkipped);
    setSize(image_xscale+.5,image_yscale+.5);
} 

//Go To Slot
if targetSlot != undefined
{
    var _time = 30;
    
    TweenEasyMove(x,y,targetSlot.x,targetSlot.y,0,_time,EaseInBack);
    
    alarm[3] = _time;
}

//Finish Prepare
if diceId == 3
{
    oDonePrepButton.alarm[0] = 60;
}