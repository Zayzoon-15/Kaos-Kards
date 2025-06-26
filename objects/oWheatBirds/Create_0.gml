
randomize();
spd = random_range(35,45);
slowSpd = 10;

if instance_exists(oEnemyPhoto)
{
    direction = point_direction(x,y,oEnemyPhoto.x,oEnemyPhoto.y);
} else instance_destroy();


shake = 0;

canhurt = true;
damage = irandom_range(1,3)*global.multiplier;