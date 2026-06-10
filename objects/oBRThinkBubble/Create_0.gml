//Set Position
x = ROOM_CENTER.x;
y = 704;

//Set Menu
global.menuOpen = true;
pressed = false;

//Text Setup
textShow = 0;
textAnims = [];
clickAlpha = 0;
maxWidth = bbox_right - bbox_left;

//Sound
textSound = 0;

//Animation
curveSpd = .04;
textShowSpd = .5;

//Animate
TweenEasyScale(.5,.5,1,1,0,30,EaseOutBack);
TweenEasyFade(0,1,0,20,EaseOutCubic);