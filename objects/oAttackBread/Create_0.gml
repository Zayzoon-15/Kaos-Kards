
//Check if No Target
if !variable_instance_exists(self,"target")
{
    show_message($"No Target Found In {object_get_name(object_index)}");
}

//Stats
spd = 12;
value = round(value);
value *= .35;

//Set Position
if target == "Enemy"
{
    vspeed = -spd;
    image_angle = 0;
} else {
    image_angle = 180;
    vspeed = spd;
}

y += yOffset;

//Trail
alarm[0] = 5;