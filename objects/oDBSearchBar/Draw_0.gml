#region Draw Cards Falling

//Create Surface
var _surface = surface_create(sprite_width-2,sprite_height-1);
surface_set_target(_surface);
draw_clear_alpha(c_black,0);

//Draw Background
draw_set_colour(#403F4C);
draw_rectangle(0,0,surface_get_width(_surface),surface_get_height(_surface),false);

//Draw Cards
draw_sprite_tiled_ext(sSettingsCards,0,cardsOffset.x,cardsOffset.y,1,1,#938DB2,.6);

//Move Cards
cardsOffset.x += .3;
cardsOffset.y += .35;

//Reset Stuff
surface_reset_target();
drawReset();

//Draw Surface
draw_surface(_surface,bbox_left+1,bbox_top+1);
surface_free(_surface);

#endregion


//Draw Box
draw_self();

//Draw Outline FOR NOW
if focused then draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);

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