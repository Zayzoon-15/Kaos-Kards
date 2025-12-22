//Go To Slot Position 
timeSourceCreate(2,function()
{
	x = slot.x;
	targetX = x;
	cardX = x;
	cardTargetX = x;
	
},[],time_source_units_frames);

//Position
targetX = x;
targetY = y;

//Card Position
cardX = x;
cardY = y;
cardTargetX = x;
cardTargetY = y;

//Shadow
shadowX = 0;
shadowY = 0;
shadowSize = 0;

//Depth
startDepth = depth;

//Set Sprite
sprite_index = info.sprite;

//Slot
slot = noone;
with oParSlots
{
    if slotId == other.slotId
    {
        other.slot = self.id;
    }
}

//Hover
canGrab = true;
hover = false;