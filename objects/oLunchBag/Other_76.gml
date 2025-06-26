if event_data[? "event_type"] == "sprite event" and sprite_index == sLunchBagFront
{
    switch (event_data[? "message"])
    {
        case "LunchBagSuck":
            instance_destroy(oLunchBreak);
            instance_create_layer(room_width/2,room_height/2,"Instances",oLunchBreakSuck,{
                lunch : true,
            });
            instance_create_layer(room_width/2,room_height/2,"Instances",oLunchBreakSuck,{
                lunch : false,
            });
        break;
        
        case "LunchBagWait":
            image_speed = 0;
            with oLunchBag
            {
                image_speed = 0;
            }
        break;
    }
}