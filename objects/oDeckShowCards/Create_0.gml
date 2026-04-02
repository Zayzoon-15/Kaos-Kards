//Set Id
handSize = 0;

//Set Position
switch (info.type) {
	case CARDTYPES.ACTION: ystart = oDeckShowMenu.bbox_top + sprite_get_height(sCardBlank) - 30; break;
    case CARDTYPES.DICE: ystart -= 50; break; 
    case CARDTYPES.KAOS: ystart = oDeckShowMenu.bbox_bottom - 60 - sprite_get_height(sCardBlank); break;
}
//ystart -= 40;
y = ystart;

//Position
targetX = x;
targetY = y;

//Card Position
cardX = x;
cardY = y;
cardTargetX = x;
cardTargetY = y;
cardXOffset = 0;
cardYOffset = 0;

//Info
uses = info.uses;

//Get Max Amount
maxCardAmount = 0;
switch (info.type) {
	case CARDTYPES.ACTION: maxCardAmount = global.currentDeck.maxActionCards; break;
    case CARDTYPES.DICE: maxCardAmount = global.currentDeck.maxDiceCards; break;
	case CARDTYPES.KAOS: maxCardAmount = global.currentDeck.maxKaosCards; break;
}

//Drawing
shadowX = 0;
shadowY = 0;
sprite_index = info.sprite;
shadowSize = 0.05;
shake = 0;
startDepth = depth;
targetScale = 1;
showPlaced = true;

//Grabbing
grabbed = false;
canGrab = true;
canMove = true;
offsetX = 0;
offsetY = 0;
hover = false;

//3d Card
cardFront = sprite_index;
cardBack  = global.currentDeck.sprite;
cardAngle = 0;
onMouse = 0;

//Fade
TweenEasyFade(0,1,0,10,EaseOutCubic);

//Set Text
textInfo = "";
setText = function()
{
    textInfo = struct_copy(info);
    if discarded
    {
        textInfo.desc += "[s][lg](Card was discarded)";
    } else if placed {
        textInfo.desc += "[s][lg](Card is in use)";
    }
}
setText();