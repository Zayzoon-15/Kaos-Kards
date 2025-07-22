//Inherit the parent event
event_inherited();

//Movement
randomize();
gravity = .5;
vspeed = -random_range(5,8);
hspeed = random_range(1,5)*dir;
spinSpd = random_range(1,5)*dir;

//Scale
var _scale = random_range(.7,1.3);
setSize(_scale,_scale);