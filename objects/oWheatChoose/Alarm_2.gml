///@desc Attack Player
birdAmount ++;

var _birdX = random_range(300,room_width-300);
var _birdY = random_range(room_height-400,400);
var _dir = choose(-1,1);
var _inst = instance_create_layer(_birdX,_birdY,"Effects",oWheatBirds,{
        target : target,
        imageDir : _dir
});

with (_inst) {
	setSize(.2*_dir,.2);
}

if birdAmount < 10
{
    alarm[2] = 10;
} else instance_destroy();