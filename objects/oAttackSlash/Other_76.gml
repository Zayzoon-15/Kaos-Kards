if event_data[? "event_type"] == "sprite event" // or you can check "sprite event"
{
    switch (event_data[? "message"])
    {
        case "slashSound":
        //Sound
        randomize();
        var _pitch = random_range(.8,1.2);
        audio_play_sound(snSlash,0,false,.5,0,_pitch);
        break;
    }
}