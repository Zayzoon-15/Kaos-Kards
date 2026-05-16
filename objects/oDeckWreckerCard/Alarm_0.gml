///@desc Start Rip

//Sound
timeSourceCreate(33,audioPlaySfx,[[snRipcard1]],time_source_units_frames);

//Start Rotation
TweenEasyRotate(0,-100,0,30,EaseInOutCirc);

//Rip
timeSourceCreate(35,function(){
    
    //Rotate
    TweenEasyRotate(-100,-70,0,25,EaseOutBack);

    //Rip Animation
	var _time = 15, _delay = 5, _dist = 70, _ease = EaseOutBack, _ang = 5;
	TweenFire(self,_ease,TWEEN_MODE_ONCE,false,_delay,_time,"ripOneY",0,-_dist);
    TweenFire(self,_ease,TWEEN_MODE_ONCE,false,_delay,_time,"ripTwoY",0,_dist);
	TweenFire(self,_ease,TWEEN_MODE_ONCE,false,_delay,_time,"ripOneAng",0,_ang);
    TweenFire(self,_ease,TWEEN_MODE_ONCE,false,_delay,_time,"ripTwoAng",0,-(_ang));
	
    //Fade Away
	TweenEasyFade(1,0,10,15,EaseLinear);
    
	//End Kaos Event
	timeSourceCreate(1,function()
	{
		eventKaosCardDone();
		instance_destroy();
	});

},[],time_source_units_frames);