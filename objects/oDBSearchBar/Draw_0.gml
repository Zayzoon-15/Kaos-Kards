//Draw Box
draw_self();


//Draw Outline FOR NOW
if focused
{
    draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);
}

//Setup Text
textSetup(fnDBLetter,fa_left,fa_middle);
var _text = $"{text}";

//Flash Bar
if focused
{
    //Change Timer
    flashTimer += flashDir;
    
    //Switch Directions
    var _flashTime = 15;
    if flashTimer <= -_flashTime
    {
        flashDir = 1;
    } else if flashTimer >= _flashTime
    {
        flashDir = -1;
    }
    
    //Change Text To Flash Bar
    if flashDir == 1
    {
        _text = $"{text}|";
    } else _text = $"{text}";
    
    
} else { //Reset Flash
    flashTimer = 0;
    flashDir = 1;
}

//Draw Text
draw_text(bbox_left + 50,y,_text);