///@desc Open Hand

//Reset Angle
handAngle = 0;

//Change Hand
handSprite = sRewardUncHandOpen;

//Juice
TweenFire(self,EaseOutCubic,TWEEN_MODE_ONCE,false,0,20,"handXScale",1.2,handTargetScale);
TweenFire(self,EaseOutCubic,TWEEN_MODE_ONCE,false,0,20,"handYScale",.8,handTargetScale);

//Create Paper
instance_create_depth(handX,handY - 160,depth - 1,oRewardUncPaper);