//Fall
gravity = .2 * (targetEnemy ? 1 : -1);

//Choose A Direction
dir = choose(1,-1);

//Move
vspeed = irandom_range(3,5) * (targetEnemy ? -1 : 1);
hspeed = irandom_range(2,7) * dir;

//Rotate
rotateSpd = .01;

//Value
value = irandom_range(2,8);