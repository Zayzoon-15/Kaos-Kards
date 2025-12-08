//Set Sprite
spriteLoopFrames(currentAnim,3); //Loop Sprite
if !winner then frame = 0; //Don't Play Animation

//Animate
var _value = animGetValue(acRps,animPos);
animPos += animSpd;
image_angle = handId == 1 ? _value : -_value;

//Choose Action
if animPos >= .5 and played and currentAnim != action
{
	//Set Animation
	currentAnim = action;
	
	//Check Who Won
	alarm[0] = 30;
}

//Move Forward
if winner
{
	var _x = handId == 1 ? 10 : room_width + 10;
	x = lerp(x,_x,.2);
}