///@desc Go To Slot

//Set State
state = diceStates.combine;

//Skipped
if targetSlot == undefined
{ 
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
    //Setup
    var _time = 60;
    var _rangeId = 1;
    
    
    //Do After Range Function
    var _slotId = 0;
    repeat (4) {
        with oCard
        {
    
            if state == CARDSTATE.PLACED and variable_struct_exists(info,"afterRange") and info.afterRange != undefined and slot.slotId == _slotId
            {
                _time += 30;
                alarm[3] = 25 + (_rangeId*30);
                _rangeId += 1;
            }
            
        }
        _slotId += 1;
    }
    
    //Set Button
    //oDonePrepButton.alarm[0] = _time;
    timeSourceCreate(_time,allCardValuesGained,[],time_source_units_frames);
}

