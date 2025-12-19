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
	alarm[1] = 45;
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
    //Sound
	switch handDown
	{
		case 1: audioPlaySfx(snRpsRock); break;
		case 2: audioPlaySfx(snRpsPaper); break;
		case 3: audioPlaySfx(snRpsScissor); break;
		case 4: audioPlaySfx(snRpsShoot); break;
	}
	
    //Set Var
    soundPlayed = true;
}