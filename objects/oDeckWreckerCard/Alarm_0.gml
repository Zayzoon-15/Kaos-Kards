///@desc Start Rip

TweenEasyRotate(0,-100,0,40,EaseInOutCirc);

timeSourceCreate(45,function(){
    TweenEasyRotate(-100,-60,0,40,EaseInOutExpo);
    
    TweenFire(self,EaseInOutExpo,TWEEN_MODE_ONCE,false,0,40,"ripOneY",0,30);
    TweenFire(self,EaseInOutExpo,TWEEN_MODE_ONCE,false,0,40,"ripTwoY",0,30);
},[],time_source_units_frames);