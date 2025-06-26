
//Position
targetX = x;
targetY = y;

offsetX = 0;
offsetY = 0;

shadowX = 0;
shadowY = 0;
shadowSize = 0;

x = oDeck.x;
y = oDeck.y;

//Clicking
canGrab = false;
slot = noone;
wasPlaced = false;
canBePlaced = true;

//Animation
shake = 0;
showWarnText = false;

//Depth
startDepth = depth;
depth = startDepth - 10;

rangeTextSize = 1;
showRange = false; 
currentRange = 0;


//State
enum CARDSTATE {
	HAND,
    GRABBED,
    PLACED
}

state = CARDSTATE.HAND;


//Info
cardInfo = {
    name : "Name",
    type : "Action",
    desc : "Desc",
    range : {min : 1, max : 6},
    boxsize : {width:100,height:50},
    textYOffset : 0
}

cardAction = "None";

action = function()
{
    show_message("Put action here");
}

//Look At Card Notes To See How To Format
