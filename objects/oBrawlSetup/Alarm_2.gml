///@desc Go Away

//Fade
depth -= 10;
fade = true;

//Tween
TweenEasyScale(1,1,0,0,50,35,EaseInBack);
alarm[3] = 90;

//Audio
timeSourceCreate(65,function(){
	audioPlaySfx(snCloseWindow);
},[],time_source_units_frames);