//Inherit the parent event
event_inherited();

//Shadow
drawShadow = false;

//Get Direction
dir = choose(-1,1);

//Move Up
yspd = -random_range(6,9);
grav = .5;

//Spin
spinSpd = random_range(1,5)*dir;