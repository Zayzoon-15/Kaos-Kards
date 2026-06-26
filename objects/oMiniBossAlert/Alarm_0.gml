///@desc Flash Triangle

TweenFire(self,EaseOutQuad,TWEEN_MODE_ONCE,false,0,30,"triFlash",triFlash,triFlash == 1 ? 0 : 1);
if animate then alarm[0] = triFlash == 1 ? 60 : 30;