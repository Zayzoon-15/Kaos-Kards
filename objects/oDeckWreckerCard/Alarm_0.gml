///@desc Start Rip

TweenEasyRotate(0,-100,0,30,EaseInOutCirc);

timeSourceCreate(35,function(){
    TweenEasyRotate(-100,-70,0,25,EaseInOutExpo);
    //35
    //TweenFire(self,EaseInOutExpo,TWEEN_MODE_ONCE,false,0,40,"ripOneY",0,-50);
    //TweenFire(self,EaseInOutExpo,TWEEN_MODE_ONCE,false,0,40,"ripTwoY",0,50);
	
	var _time = 15, _delay = 5, _dist = 70, _ease = EaseInOutExpo;
	TweenFire(self,_ease,TWEEN_MODE_ONCE,false,_delay,_time,"ripOneY",0,-_dist);
    TweenFire(self,_ease,TWEEN_MODE_ONCE,false,_delay,_time,"ripTwoY",0,_dist);
	
	var _time = 15, _delay = 5, _ang = 5, _ease = EaseInOutExpo;
	TweenFire(self,_ease,TWEEN_MODE_ONCE,false,_delay,_time,"ripOneAng",0,_ang);
    TweenFire(self,_ease,TWEEN_MODE_ONCE,false,_delay,_time,"ripTwoAng",0,-(_ang));
	
	TweenEasyFade(1,0,35,25,EaseLinear);
	
	//End Kaos Event
	timeSourceCreate(1,function()
	{
		eventKaosCardDone();
		instance_destroy();
	});

},[],time_source_units_frames);