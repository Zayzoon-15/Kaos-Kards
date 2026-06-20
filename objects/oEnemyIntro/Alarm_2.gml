//@desc Exit

var _time = 50;

TweenFire(self,EaseInBack,TWEEN_MODE_ONCE,false,0,_time,"enemyX",enemyX,SCREEN_EDGE.right + 200);
TweenFire(self,EaseInBack,TWEEN_MODE_ONCE,false,0,_time,"enemyY",enemyY,ROOM_CENTER.y);
TweenFire(self,EaseInBack,TWEEN_MODE_ONCE,false,0,_time,"enemyXScale",enemyXScale,1);
TweenFire(self,EaseInBack,TWEEN_MODE_ONCE,false,0,_time,"enemyYScale",enemyYScale,1);
TweenFire(self,EaseInBack,TWEEN_MODE_ONCE,false,0,_time,"easeTime",1,0);
TweenEasyFade(1,0,0,_time+10,EaseInCubic);

with (oEnemyIntroBtn) {
	TweenFire(self,EaseInBack,TWEEN_MODE_ONCE,false,0,_time,"y",y,SCREEN_HEIGHT + 50);
}

timeSourceCreate(_time+10,instance_destroy,[self],time_source_units_frames);