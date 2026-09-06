///@desc Grab Card
if hover and canMove and grabbable and !global.holdingCard and !global.mobile {

	//Set Grab Offset
	grabOffsetX = mouse_x - x;
	grabOffsetY = mouse_y - y;
	
	//Set Grabbed
	grabbed = true;
	global.holdingCard = true;
	
	//Set State
	state = CARD_STATES.GRABBED;
	
	//Function
	onGrab();
	
}