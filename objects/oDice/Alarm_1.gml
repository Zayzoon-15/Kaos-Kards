///@desc Combine

//Set State
state = DICE_STATES.COMBINE;

//Check If Skipped
if targetSlot == undefined {
    
    //Set State
    state = DICE_STATES.SKIPPED;
    
    //Give Combo For Skipping
    if !global.disabledSlots.player[diceId] {
        global.playerComboMeter += irandom_range(clamp(diceNum - 3, 2, diceNum), diceNum + 2);
    }
    
    //Juice
    instance_create_layer(x, bbox_top, "Effects", oEffectSkipped);
    setSize(1.5, 1.5);
    
} else { //Go To Slot
    
    //Move Towards Slot *with passion*
    TweenEasyMove(x, y, targetSlot.x, targetSlot.y, 0, .5, EaseInBack);

    //Finish Combine
    d_alarm[2] = 30;
    
}

//Finish Prepare
if diceId == 3 {
    
}


/*

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
    timeSourceCreate(_time,eventAllCardValuesGained,[],time_source_units_frames);
}

