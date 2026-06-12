///@desc Leave Unc

//Hand Swap Sprite
TweenFire(self,EaseInOutQuint,TWEEN_MODE_ONCE,false,10,20,"handAngle",handAngle,-180);
timeSourceCreate(20,function()
{
    handSprite = sRewardUncHandSide;
    //handAngle = 0;
},[],time_source_units_frames);

//Hand Leave
TweenFire(self,EaseInOutQuart,TWEEN_MODE_ONCE,false,0,60,"handX",handX,x);
timeSourceCreate(90,function(){
    handY = SCREEN_HEIGHT + sprite_height + 20;
},[],time_source_units_frames);

//Leave Unc
TweenEasyMove(x,y,x,SCREEN_HEIGHT + sprite_height + 20,110,200,EaseInCubic);

//Fade Bg
TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,110,150,"bgAlpha",bgAlpha,0);

//Destroy Unc
alarm[3] = 130;

////Rotate Hand
//TweenFire(self,EaseInBackSofter,TWEEN_MODE_ONCE,false,0,20,"handAngle",0,-180);

////Change Sprite
//timeSourceCreate(25,function() {
    //handSprite = sRewardUncHandSide;
    //handAngle = 0;
    //TweenFire(self,EaseOutBackSofter,TWEEN_MODE_ONCE,false,0,20,"handAngle",20,0);
//},[],time_source_units_frames);