//Set Sprite
spriteLoopFrames(currentAnim,3); //Loop Sprite
if !winner then frame = 0; //Don't Play Animation

//Animate
var _value = animGetValue(acRps,animPos);
animPos += animSpd;
image_angle = handId == 0 ? _value : -_value;

//Choose Action
if animPos >= .5 and played and currentAnim != action
{
	//Set Animation
	currentAnim = action;
	
	//Check Who Won
	alarm[1] = 30;
}

//Move Forward
if winner
{
	var _x = handId == 0 ? 0 : room_width;
	x = lerp(x,_x,.2);
}

//Play Sound
if animPos >= .5 and !soundPlayed
{
    //Stars
    var _x = handId == 0 ? bbox_right - 10 : bbox_left + 10;
    starEffect(_x,y,10,true,40,150,40);
    
    //Set Var
    soundPlayed = true;
}