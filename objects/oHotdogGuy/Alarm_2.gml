///@desc Choose Winner

//Set Winner
var _winner = undefined;
with oHotdogGuy
{
    if ate < other.ate
    {
        _winner = true;
    } else if ate > other.ate
    {
        _winner = false;
    }
}

//Draw
if _winner == undefined
{
    print("HOTDOG DRAW");
    exit;
}

winner = _winner;

//Won
if _winner
{
    hotdogImage = 1;
    effectStar(x,y,10);
    sprite_index = sHotdogGuyFull;
} else sprite_index = sHotdogGuySad;


//Outcome
alarm[3] = 30;