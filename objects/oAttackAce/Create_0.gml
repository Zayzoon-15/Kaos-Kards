
//Check if No Target
if !variable_instance_exists(self,"target")
{
    show_message($"No Target Found In {object_get_name(object_index)}");
}

//Stats
spd = 13;

value = round(value);
value *= .5;


//Sound
var _sound = asset_get_index($"snFire{irandom_range(1,2)}");
audio_play_sound(_sound,0,false);

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

//Fire Effect
//partFireEffect(x,y,30,50);
//partFireEffect(x,y,30,-50);
//partFireEffect(x,y,-30,50);
//partFireEffect(x,y,-30,-50);
//partFireEffect(x,y,10,50);
//partFireEffect(x,y,-10,50);
//partFireEffect(x,y,10,-50);
//partFireEffect(x,y,-10,-50);
//partFireEffect(x,y,30,10);
//partFireEffect(x,y,-30,10);
//partFireEffect(x,y,30,-10);
//partFireEffect(x,y,-30,-10);
//partFireEffect(x,y,30,30);
//partFireEffect(x,y,-30,30);
//partFireEffect(x,y,30,-30);
//partFireEffect(x,y,-30,-30);
//partFireEffect(x,y,0,0);
//partFireEffect(x,y,0,10);
//partFireEffect(x,y,0,-10);
//SO MUCH ToT