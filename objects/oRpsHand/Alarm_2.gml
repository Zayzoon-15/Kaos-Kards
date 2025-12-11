///@desc End Kaos

//Leave
var _x = handId == 0 ? -sprite_width : room_width + sprite_get_width(sprite_index);
TweenEasyScale(image_xscale,1,0,1,0,40,EaseInBack);
TweenEasyFade(1,0,0,40,EaseInBack);

//Destroy
timeSourceCreate(40,function(){instance_destroy();},[],time_source_units_frames);

//End Kaos
timeSourceCreate(1.3,kaosCardDone);