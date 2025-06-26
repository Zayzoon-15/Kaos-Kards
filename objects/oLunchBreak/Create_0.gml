
//Change Bg Color
bgId = layer_background_get_id("Background");
ogBgColor = layer_background_get_blend(bgId);
layer_background_blend(bgId, c_black);


//LunchBreak Text
showText = false;
lunchScale = 2;
breakScale = 2;

//Time Sources
timeSources = [

//Show Everything
time_source_create(time_source_game, 1.26, time_source_units_seconds,function(){
    layer_background_blend(bgId,ogBgColor);  
    showText = true;
}),

//Snare Hit
time_source_create(time_source_game, 2.87, time_source_units_seconds,function(){
    lunchScale -= .5;
    breakScale -= .5;
}),

//Lunch Hit
time_source_create(time_source_game, 3.02, time_source_units_seconds,function(){
    lunchScale = 3;
}),

//Break Hit
time_source_create(time_source_game, 3.45, time_source_units_seconds,function(){
    breakScale = 3;
}),

//Spawn Bag
time_source_create(time_source_game, 4.20, time_source_units_seconds,function(){
    instance_create_layer(1352,640,"BagFront",oLunchBag,{
        sprite_index : sLunchBagFront
    });
    instance_create_layer(1352,640,"BagBack",oLunchBag,{
        sprite_index : sLunchBagBack
    });
}),

];


//Start Time Sources
for (var i = 0; i < array_length(timeSources); i++) {
	time_source_start(timeSources[i]);
}


//Start Audio
audio_play_sound(snLunchBreak,10,false);