//Scale
setSize(.6);
startScale = image_xscale;

//Shadow
shadowX = 0;
shadowY = 8;
shadowSize = 0;

//Drawing
startDepth = depth;
sineTimes = {
    x : random(20),
    y : random(20),
    angle : random(20),
}
sineX = 0;
sineY = 0;

//Mouse
canGrab = false;
hover = false;
pressed = false;
offsetX = 0;
offsetY = 0;

//Position
targetX = x;
targetY = y;
showY = 0;
showX = 0;

//New Transition
if shopMenu
{
    //Move
    TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,25,"targetX",x,ROOM_CENTER.x);
    TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,25,"targetY",y,ROOM_CENTER.y);
    
    //Scale
    TweenFire(self,EaseOutBack,TWEEN_MODE_ONCE,false,0,25,"startScale",image_xscale,1);
}
