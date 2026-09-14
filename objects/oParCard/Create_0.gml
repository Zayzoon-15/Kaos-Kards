/* This object is the main card object
 * It has all the main things cards need
 * With its children changing or adding things
 * to make them work where they need to work
*/

//Inherit Delta Object
event_inherited();

//Info
info ??= CardsAction.Bread;
sprite_index = info.sprite;

#region --- Position ---

//Speeds For Easing
xspd = 0;
yspd = 0;

//Target Position
targetX = x;
targetY = y;

//Placed Position (Stuff like slots and hand placement)
followPlaced = true; //If the card should follow the placed position
placedX = x;
placedY = y;

//Offsets
cardOffsetX = 0;
cardOffsetY = 0;

#endregion

#region --- Image ---

//Scale
scaleTargetX = 1;
scaleTargetY = 1;

//Effects
shake = 0;
flashAlpha = 0;
flashColor = c_white;

//Shadow
shadowFollowRoomCenter = true; //If the shadow should be based off the room center
shadowTargetX = 0;
shadowTargetY = 8;
shadowTargetSize = 0.05;
shadowX = 0;
shadowY = 0;
shadowSize = shadowTargetSize;
shadowOffsetX = 0;
shadowOffsetY = 0;

//Angle
angelVel = 0;

//3D Card
card3dRot = 0;
card3dTween = noone;

#endregion

#region --- States ---

enum CARD_STATES {
	HAND,
	GRABBED,
	PLACED
}

//State
state = CARD_STATES.PLACED;

//Toggles
grabbable = true; //If the card can be grabbed
hoverable = true; //If the card can be hovered
placeable = false; //If enabled when the card is let go its last position will be the new placed position
canMove = true; //If the card can be moved

//Mouse
hover = false;
mouseTime = 0;

//Grab
grabbed = false;
grabOffsetX = 0;
grabOffsetY = 0;

#endregion

#region --- Custom Functions ---

//Fires when card is barley hovered 
onHover = function() {
	
}

//Fires when card is grabbed 
onGrab = function() {
	
}


//Fires when card is let go after being grabbed 
onLetgo = function() {
	
}

#endregion

