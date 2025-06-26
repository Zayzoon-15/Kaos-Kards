
//Positions
var _centerX = display_get_gui_width()/2;
var _centerY = display_get_gui_height()/2;

//Setup Text
draw_set_font(fnMain);
draw_set_halign(fa_center);

if global.gamePaused and !global.midTrans
{
    
    //Black Rectangle
    draw_set_color(c_black);
    draw_set_alpha(.4);
    draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false);
    draw_set_color(c_white);
    draw_set_alpha(1);
    
    //Draw Game Paused
    draw_set_valign(fa_top);
    draw_text_transformed(_centerX,20,"Game Paused", 5, 5, 0);
    
    //Draw Menu Text
    draw_set_valign(fa_middle);
    var _menuLength = array_length(menuText);
    var _menuText = "";
    
    for (var i = 0; i < _menuLength; i++) {
    	_menuText += $"{menuText[i]}\n";
    }
    
    draw_text_transformed(_centerX,_centerY,_menuText, 3, 3, 0);
    
    
}