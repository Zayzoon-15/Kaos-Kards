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
	
	//Set 3d Card To Zero (No Spin)
	if TweenIsActive(card3dTween) then TweenStop(card3dTween);
	card3dRot = 0;
	
	//Function
	onGrab();
	
}