//Inherit the parent event
event_inherited();

//LifeSpan
lifespan = random_range(10,15);

//Movement
hspeed = random_range(1,1.5)*choose(1,-1);
vspeed = random_range(1,3)*dir;
spinSpd = random_range(1,3);

//Scale
var _scale = random_range(1.5,2.5);
setSize(_scale,_scale);