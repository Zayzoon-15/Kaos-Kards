
//Position
targetX = x;
targetY = y;
x = oDeck.x;
y = oDeck.y;

//Card Position
cardX = x;
cardY = y;
cardTargetX = x;
cardTargetY = y;

//Drawing
shadowX = 0;
shadowY = 0;
shadowSize = 0.05;
shake = 0;
startDepth = depth;
sprite_index = info.sprite;

//Grabbing
canGrab = true;
offsetX = 0;
offsetY = 0;

//State
enum CARDSTATE
{
    HAND,
    GRABBED,
    PLACED
}

state = CARDSTATE.HAND;