//Set Sprite
spriteLoopFrames(currentAnim,3); //Loop Sprite
if !winner then frame = 0; //Don't Play Animation

//Animate
var _value = animGetValue(acRps,animPos);
animPos += animSpd;
image_angle = handId == 0 ? _value : -_value;

//Choose Action
if animPos >= .5 and played
{
    //Choose If Handsy
    if global.currentEnemy == enemyInfo.handsy and handId == 0 and irandom_range(1,5) == 1
    {
        with oRpsHand
        {
            if handId == 1
            {
                ///Get Counter
                //Rock = 0, Paper = 1, Scissor = 2
                var _counter = action;
                if action == 0 then _counter = 1;
                if action == 1 then _counter = 2;
                if action == 2 then _counter = 0;
                
                //Set Action
                other.action = _counter;
            }
        }
    }
    
	//Set Animation
	currentAnim = action;
    
	//Check Who Won
	alarm[1] = 55;
    played = false;
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