//Set Default Info
info ??= actionCards.bread;

//Set Sprite
sprite_index = info.sprite;

//Scale
TweenEasyScale(0,0,.7,.7,0,30,EaseOutBack);
startScale = .7;

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
canHover = true;
hover = false;
grabbed = false;
offsetX = 0;
offsetY = 0;

//Position
targetX = x;
targetY = y;
cardY = 0;
cardX = 0;
