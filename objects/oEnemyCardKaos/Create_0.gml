//Position
targetX = x;
targetY = y;

//Shadow
shadowX = 0;
shadowY = 0;
shadowSize = 0;

//Range
rangeTextSize = 1;
showRange = false; 
currentRange = 0;

//Check if Should Be Real
isReal = true;

//Info
cardInfo = {
    name : "Name",
    type : "Action",
    desc : "Desc",
    range : {min : 1, max : 6},
    boxsize : {width:100,height:50},
    textYOffset : 0
}

if !isReal
{
    enemyChaosCard = undefined;
}
