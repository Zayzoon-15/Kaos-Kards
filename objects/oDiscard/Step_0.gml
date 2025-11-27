//Set Position
x = getPosToWindow(true);

//Exit If In Enemy Room
if room == rEnemy then exit;

//Is Full
if discards >= global.maxDiscards
{
    isFull = true;
}

//Set Image
if isFull
{
    image_index = 1;
} else image_index = 0;

//Tip Box
var _text;

if !isFull
{
    var _discardsLeft = global.maxDiscards - discards;
    
    if _discardsLeft > 1
    {
        _text = $"Drag a card here to discard it\nYou have {_discardsLeft} discards left";
    } else _text = $"Drag a card here to discard it\nYou have {_discardsLeft} discard left";
    
} else _text = "You have no discards left";

if !global.holdingCard
{
    drawTipBox(_text);
}

//Info
if touchingMouse() and !global.holdingCard
{
    boxAlpha = lerp(boxAlpha,0,.2);
} else boxAlpha = lerp(boxAlpha,1,.2);