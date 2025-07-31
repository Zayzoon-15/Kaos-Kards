//Inherit the parent event
event_inherited();

//LifeSpan
lifespan = random_range(10,20);

//Movement
vspeed = random_range(2,4)*dir;
spinSpd = random_range(1,3);

//Scale
var _scale = random_range(.7,1.3);
setSize(_scale,_scale);