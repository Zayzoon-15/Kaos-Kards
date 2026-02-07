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

//Choose
if _winner == undefined
{
    print("HOTDOG DRAW");
    exit;
}

if _winner
{
    sprite_index = sHotdogGuyFull;
} else sprite_index = sHotdogGuySad;
