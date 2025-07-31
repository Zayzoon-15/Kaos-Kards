//Inherit the parent event
event_inherited();

//Shadow
drawShadow = false;

//Get Direction
dir = choose(-1,1);

//Move Up
vspeed = -random_range(6,9);
gravity = .5;

//Spin
spinSpd = random_range(1,5)*dir;