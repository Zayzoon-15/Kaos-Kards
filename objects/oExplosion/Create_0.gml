randomize();

var _size = random_range(1.8,2.2)*targetSize;
setSize(_size,_size);

var _pitch = random_range(.7,1.2);
audio_play_sound(snExplosion,0,false,.2,0,_pitch);