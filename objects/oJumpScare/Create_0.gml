//Set Image
randomise();
image_index = irandom_range(0,image_number-1);

//Sound
audioPlaySfx(snBoo,.8,1.2);

//Scale
TweenEasyScale(0,0,3,3,0,20,EaseOutCubic);
TweenEasyFade(1,0,10,20,EaseLinear);
timeSourceCreate(20,function(){
    instance_destroy();
},[],time_source_units_frames);

//Crash Game
if irandom_range(1,50) == 1
{
    //Image
    image_index = 0;
    sprite_index = choose(sJumpscare1,sJumpscare2,sJumpscare3);
    
    //Sound
    audio_stop_sound(snBoo);
    audioPlaySfx(snJumpscare,1,1,80);
    
    //Crash
    timeSourceCreate(30,function(){
        game_end();
    },[],time_source_units_frames);
}