//Set Id
handSize = 0;

//Set Position
switch (info.type) {
	case CARDTYPES.ACTION: ystart = oDeckShowMenu.bbox_top + sprite_get_height(sCardBlank) - 30; break;
    case CARDTYPES.DICE: ystart -= 40; break; 
    case CARDTYPES.KAOS: ystart = oDeckShowMenu.bbox_bottom - 50 - sprite_get_height(sCardBlank); break;
}
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
//TweenEasyFade(0,1,0,20,EaseLinear);