
//Card Position
cardTargetX = x;
cardTargetY = y;
cardX = x;
cardY = y;

//Shadow
shadowX = 0;
shadowY = 0;
shadowSize = 0;

//Depth
startDepth = depth;

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

//Set Sprite
sprite_index = info.sprite;