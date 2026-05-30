//Set Default Info
info ??= actionCards.bread;

//Set Sprite
sprite_index = info.sprite;

//Scale
setSize(.7);
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
grabbed = false;
offsetX = 0;
offsetY = 0;

//Position
targetX = x;
targetY = y;
