//Move
if animate
{
    y = (ystart + distance) - (distance * animGetValue(acMiniBoss,animPos,"border"));
    animPos += animSpd;
}

//Inherit
event_inherited();
