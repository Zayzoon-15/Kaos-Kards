//Inherit the parent event
event_inherited();

//Life
lifespan = random_range(5,10);
fadeSpd = 0.08;

//Movement
vspeed = random_range(1,2) * choose(-1,1);
hspeed = random_range(1,2)*dir;

//Scale
var _scale = random_range(.6,1.3);
setSize(_scale);