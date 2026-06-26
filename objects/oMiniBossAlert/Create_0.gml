//Setup
x = ROOM_CENTER.x;
y = ROOM_CENTER.y;
image_alpha = 0;
global.menuOpen = true;
var _delay = 30, _time = 25;

//Anim Curve
animate = false;
animPos = 0;
animSpd = 0.03;
timeSourceCreate(_delay,function()
{
    //Animate
    animate = true;
    
    //Create Button
    instance_create_depth(ROOM_CENTER.x,640,depth-1,oMiniBossBtn);
    
},[],time_source_units_frames);

//Fade In
TweenEasyFade(0,1,_delay,_time,EaseOutCubic);
TweenEasyScale(.2,.2,1,1,_delay,_time,EaseOutBack);
//TweenEasyRotate(50,0,_delay,_time+5,EaseOutElastic);

//Electric Thing
elecFrame = 0;

//Border
borderEase = 0;

//Triangle
triFlash = 0;
alarm[0] = 60; //Flash