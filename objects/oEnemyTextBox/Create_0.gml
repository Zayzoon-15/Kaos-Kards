//Set Correct Position
x -= sprite_width;
y -= floor(sprite_height/2);

//Text
textShow = "";
textPos = 0;
textSpd = .5;

//Talking
startTalking = false;
doneTalking = false;

//Fade In
TweenEasyFade(0,1,0,15,EaseOutCubic);

//Timers
timeSourceCreate(10,function() {
   startTalking = true; 
},[],time_source_units_frames);