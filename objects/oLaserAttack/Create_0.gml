//Inherit the parent event
event_inherited();

//Flip
flipSprite = true;
flipBackwards = true;
posBasedOnCard = true;

//Stats
currentlyDamaging = false;

//Reduce Value
value *= 0.3;

//Set Sprite
sprite_index = sLaserStart;
depth -= 2;

//Beam Clash
beamClash = false;
beamSprite = noone;
beamFrame = 0;
beamSpd = sprite_get_speed(sLaserClashStart)/60;

//Laser
laserDone = false;
laserSound = noone;
loopShake = false;

//Card Setup
card.rotAngle = false;
card.curvePos = 1;

//Alarm Values
delayTime = 40;
laserTime = 60*2;


//Functions
action = function()
{
    var _yCenter = targetEnemy ? y - 250 : y + 250;
    var _x = random_range(-30,30);
    var _y = random_range(-80,80);
    
    hurtEffect(x+_x,_yCenter+_y);
    damageTarget();
}

reflected = function()
{
	//Stop Shake
	card.cardSetShake(0);
	loopShake = false;
    
	//Stop Sound
	audio_sound_gain(laserSound,0,60);
}