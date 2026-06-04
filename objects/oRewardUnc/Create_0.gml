//Set Position
x = room_width - sprite_width/2 - 20;
y = SCREEN_HEIGHT + sprite_height + 20;

//Disable Everything
oReward.canInteract = false;

//Move Up
TweenEasyMove(x,y,x,SCREEN_HEIGHT,20,200,EaseOutCubic);

//Background
bgAlpha = 0;
TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,5,150,"bgAlpha",0,.7);

//Hand Values
handX = x;
handY = y;
handAngle = 0;
handSprite = sRewardUncHandClosed;
handImage = 0;
handXScale = 1;
handYscale = 1;

//Show Hand
alarm[0] = 230;