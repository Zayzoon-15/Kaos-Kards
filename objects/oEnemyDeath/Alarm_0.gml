///@desc Start Explosions

randomize();
var _x = x + random_range(-120,120);
var _y = y + random_range(-120,120);

explosionEffect(_x,_y);

image_speed = 2.5;

shake = 10;

if deathTime <= 30
{
    sprite_index = deathSprite;
    image_speed = 1;
}

if deathTime > 0
{
    alarm[0] = 5;
} else {
    alarm[1] = 60*3;
} 