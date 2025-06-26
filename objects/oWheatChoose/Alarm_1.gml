///@desc Attack Enemy

birdAmount ++;

var _birdY = random_range(room_height-30,100);
instance_create_layer(-30,_birdY,"Effects",oWheatBirds,{
        target : target,
        imageDir : 1
});

if birdAmount < 10
{
    alarm[1] = 10;
} else instance_destroy();