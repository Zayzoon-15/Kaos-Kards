///@desc Go To Slot

//Set State
state = diceStates.combine;

//Skipped
if targetSlot == undefined{ 
    instance_create_layer(x,bbox_top,"Effects",oSkippedEffect);
    setSize(image_xscale+.5,image_yscale+.5);
    skipped = true;
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