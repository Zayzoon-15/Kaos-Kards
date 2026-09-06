

#region --- Mouse ---

//Follow Mouse If Grabbed
if grabbed {
	targetX = mouse_x - grabOffsetX;
	targetY = mouse_y - grabOffsetY;
	
	//Let Go Of Card
	if !mouse_check_button(mb_left) {
		
		//Set Grabbed
		grabbed = false;
		global.holdingCard = false;
	
		//Set State
		state = CARD_STATES.PLACED;
		
		//Function
		onLetgo();
	}
}

//Set Hover
if touchingMouse() and hoverable {
	
	//Set Hover
	if !hover {
		onHover();
		hover = true;
	}
	
	//Darw Info
	drawCardText(info);
	
} else hover = false;

#endregion

#region --- Position

//Set Target Position If Following Placed Position
if followPlaced and !grabbed {
	targetX = placedX;
	targetY = placedY;
}

//Ease To Target Position
xspd = spring(x, xspd, targetX,.6,.3);
yspd = spring(y, yspd, targetY,.6,.3);
x += xspd;
y += yspd;

#endregion

#region --- Image ---

//Ease Angel Based On Velocity
var _ang = clamp(xprevious - x, - 90, 90);
angelVel = spring(image_angle, angelVel, _ang, .6, .5);
image_angle += angelVel;

//Set Shadow
if shadowFollowRoomCenter then shadowTargetX = clamp((x - (room_width/2))*.05, -10, 10);
shadowX = lerp(shadowX, shadowTargetX, .2);
shadowY = lerp(shadowY, shadowTargetY, .2);
shadowSize = lerp(shadowSize, shadowTargetSize, .2);

#endregion
