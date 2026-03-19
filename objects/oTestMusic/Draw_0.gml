textSetup(fnMain,fa_center,fa_top);
draw_text_transformed(x,10,$"Current Song: {global.curSong}\nSong Speed: {songSpeed}\nPress Enter To Start",2,2,0);


textSetup(fnMain,fa_left,fa_bottom);
draw_text_transformed(20,room_height-20,$"Controls:\n- Space to type a song\n- Up and down to change the speed",2,2,0);

var _text = currentText;

if typing
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
    _text = flashDir == 1 ? $"{currentText}|" : $"{currentText}";

    //Box
    draw_set_alpha(1);
    draw_set_colour(c_white);
    var _margin = 10;
    draw_rectangle(x-_margin-string_width(currentText),y-20,x+_margin+string_width(currentText),y+20,true);
} else { //Reset Flash
    flashTimer = 0;
    flashDir = 1;
}

textSetup(fnMain,fa_left,fa_middle);
draw_text_transformed(x-string_width(currentText),y,_text,2,2,0);

drawReset();