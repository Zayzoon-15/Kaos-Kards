dir = 0;

if target == "Enemy"
{
    dir = 1;
} else dir = -1;

randomize();
gravity = .8;
vspeed = -random_range(8,11);
angle = random_range(-2,2)*dir;

if target == "Enemy"
{
    image_angle = 0;
} else image_angle = 180;

//Direction
switch (breadId) {
	case 0:
        hspeed = random_range(-5,-3);
    break;
    
	case 1:
        hspeed = 0
    break;
    
	case 2:
        hspeed = random_range(3,5);
    break;
}

lifespan = random_range(10,30);
life = 0;

//Stars
starEffect(x,y,5);