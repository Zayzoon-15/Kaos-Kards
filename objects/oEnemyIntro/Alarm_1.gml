//@desc Enemy Show

sprite_index = info.sprite;
TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,30,"enemyXScale",enemyXScale,1.5);
TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,30,"enemyYScale",enemyYScale,1.5);
TweenFire(self,EaseOutCubic,TWEEN_MODE_ONCE,false,0,30,"flashAlpha",1,0);
TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,30,"easeTime",.7,1);
TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,30,"textScale",6,4);

//150 650
instance_create_depth(SCREEN_EDGE.left + 150,650,depth-1,oEnemyIntroBtn);