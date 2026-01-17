//Inherit the parent event
event_inherited();

//Flip
flipSprite = true;
posBasedOnCard = true;

//Stats
currentlyDamaging = false;

//Reduce Value
value *= 0.3;

//Set Sprite
sprite_index = sLaserStart;
depth -= 2;

//Laser Done
laserDone = false;

//Alarm Values
delayTime = 40;
laserTime = 60*2;

//Sound
laserSound = noone;

//Functions
action = function()
{
    var _x = random_range(-30,30);
    var _y = random_range(-80,80);
    
    hurtEffect(sprite_width/2+_x,sprite_height/2+_y);
    damageTarget();
}

reflected = function()
{
	//Stop Shake
	card.cardSetShake(0);
	
	//Stop Sound
	audio_sound_gain(laserSound,0,60);
}