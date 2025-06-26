///@desc Start Explosions

randomize();
var _x = random_range(100,room_width-100);
var _y = random_range(100,room_height-100);

explosionEffect(_x,_y,2);

if deathTime > 0
{
    alarm[0] = 5;
} else {
    alarm[1] = 60*3;
} 