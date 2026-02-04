//Position
targetX = x;
targetY = y;

//Card Position
cardX = x;
cardY = y;
cardTargetX = x;
cardTargetY = y;
cardXOffset = 0;
cardYOffset = 0;

//Info
uses = info.uses;

//Drawing
xscale = 1;
yscale = 1;
angle = 0;
shadowX = 0;
shadowY = 0;
shadowSize = 0.05;
shake = 0;
startDepth = depth;
sprite_index = info != undefined ? info.sprite : sprite_index;
cardVisible = false;

//Grabbing
grabbed = false;
canGrab = true;
canMove = true;
offsetX = 0;
offsetY = 0;
hover = false;
hoverDir = 0;

//3d Card
cardFront = sprite_index;
cardBack  = global.currentDeck.sprite;
cardAngle = 0;
cardThickness = 8;
onMouse = 0;

//Fade
TweenEasyFade(0,1,0,20/60,EaseLinear);
