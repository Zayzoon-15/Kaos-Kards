
//Check if No Target
if !variable_instance_exists(self,"target")
{
    show_message($"No Target Found In {object_get_name(object_index)}");
}

//Stats
spd = 13;

value = round(value);
value *= 1.5;

setSize(.7,.7);

//Sound
randomize();
var _pitch = random_range(.8,1.2);
audio_play_sound(snIce,0,false,.5,0,_pitch);

//Set Position
if target == "Enemy"
{
    vspeed = -spd;
    image_angle = 0;
} else {
    vspeed = spd;
    image_angle = 180;
}

setSize(.5,.5);

//Ice Effect
alarm[0] = 5;