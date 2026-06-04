//Scale
targetScale = 1;

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

//Transition
TweenEasyScale(0,0,1,1,0,20,EaseOutBack);
