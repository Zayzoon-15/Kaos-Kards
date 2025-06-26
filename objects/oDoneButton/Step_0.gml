
if canPress
{
    if touchingMouse() and !global.holdingCard
    {
        y = lerp(y,ystart-3,.3);
        shadowY = lerp(shadowY,8,.3);
    } else {
        y = lerp(y,ystart,.2);
        shadowY = lerp(shadowY,5,.2);
    } 
} else y = lerp(y,ystart+2,.2);

if canPress
{
    image_index = 0;
} else image_index = 1;

image_xscale = lerp(image_xscale,xscaleStart,.3);
image_yscale = lerp(image_yscale,yscaleStart,.3);

shake = lerp(shake,0,.2);


with oDice
{
    if diceId == 3 and gamestate == GAMESTATE.PREPARE
    {
        if rollDone
        {
            other.canPress = true;
        } else other.canPress = false;
    }
}

if gamestate == GAMESTATE.ENEMYTURN
{
    canPress = false;
}