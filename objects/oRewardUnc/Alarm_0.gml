///@desc Start To Show Hand

//TweenEasyMove(x,y,oRewardUnc.bbox_left - 500,y,0,130,EaseOutCubic);

//Set Correct Position
handY = y - 150;

//Move Hand Out
TweenFire(self,EaseOutCubic,TWEEN_MODE_ONCE,false,0,130,"handX",x,bbox_left - 500);

//Rotate Hand
TweenFire(self,EaseInOutBackSofter,TWEEN_MODE_ONCE,false,150,50,"handAngle",0,180);

//Open Hand
alarm[1] = 250;