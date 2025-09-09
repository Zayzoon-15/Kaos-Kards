//Inherit
event_inherited();

//Jump And Fall
vspeed = -random_range(5,7);
gravity = .5;

//Spin
spinSpd = random_range(1,5)*choose(-1,1);

//Fade
lifespan = random_range(10,30);
life = 0;

//Shadow
drawShadow = false;