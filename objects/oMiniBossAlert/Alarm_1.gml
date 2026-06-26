///@desc Exit

//Setup
animate = false;
var _time = 40;

//Animate
TweenEasyFade(1,0,5,35,EaseInCubic);
TweenEasyRotate(0,-50,0,_time+5,EaseInBack);
TweenEasyScale(1,1,0,0,0,_time,EaseInBack);
TweenFire(self,EaseInBack,TWEEN_MODE_ONCE,false,0,_time-10,"borderEase",1,0);
with oMiniBossBtn {
	animate = false;
    TweenEasyMove(x,y,x,ystart + distance,0,_time,EaseInBack);
}

//Destroy
timeSourceCreate(45,instance_destroy,[self.id],time_source_units_frames);