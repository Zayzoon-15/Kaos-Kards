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

//Laser Done
laserDone = false;
targetShakePower = 2;
shakePower = 0;

//Alarm Values
delayTime = 40;
laserTime = 60*2;

//Functions
action = function()
{
    randomize();
    var _x = random_range(-30,30);
    var _y = random_range(-80,80);
    
    hurtEffect(sprite_width/2+_x,sprite_height/2+_y);
    damageTarget();
}