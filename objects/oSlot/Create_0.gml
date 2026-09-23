//Inherit Delta Time
event_inherited();

//Set Slot Type
types = [CARDTYPES.ACTION];
if special {
	image_index = 1;
	types = [CARDTYPES.KAOS, CARDTYPES.DICE];
}

//Status
filled = false;
used = false;
disabled = false;

//Image
targetScale = 1;
scaleX = targetScale;
scaleY = targetScale;

//Position
slotOffsetTargetX = 0;
slotOffsetTargetY = 0;
slotOffsetX = 0;
slotOffsetY = 0;

