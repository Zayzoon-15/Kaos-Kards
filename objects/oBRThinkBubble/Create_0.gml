//DEBUG
if is_debug_overlay_open()
{
    instance_destroy();
    exit;
}

//Set Position
x = ROOM_CENTER.x;
y = 704;

//Set Menu
global.menuOpen = true;

//Pressed
pressed = false;
close = false;

//Text Setup
forceShow = false;
textShow = 0;
textAnims = [];
clickAlpha = 0;
maxWidth = sprite_width - 10;

//Animation
curveSpd = .04;
textShowSpd = .5;

//Animate
TweenEasyScale(.5,.5,1,1,0,30,EaseOutBack);
TweenEasyFade(0,1,0,20,EaseOutCubic);