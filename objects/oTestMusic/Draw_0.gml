textSetup(fnMain,fa_center,fa_top);
draw_text_transformed(x,10,$"Current Song: {global.curSong}\nCurrent Group: {struct_get_names(currentTextGroup)}\nSong Speed: {songSpeed}\nPress Enter To Start",2,2,0);

textSetup(fnMain,fa_center,fa_middle);
draw_text_transformed(x,y,currentText,2,2,0);

if groupSong then draw_text_transformed(x,y+80,currentTextGroup,2,2,0);


//Draw Button
var _string = groupSong ? "Group Song: True" : "Group Song: False";
var _w = 100;
var _h = 20;
var _x = x;
var _y = 600;
var _buttonX1 = _x - _w;
var _buttonY1 = _y - _h;
var _buttonX2 = _x + _w;
var _buttonY2 = _y + _h;
draw_button(_buttonX1, _buttonY1, _buttonX2, _buttonY2,!(point_in_rectangle(mouse_x,mouse_y,_buttonX1,_buttonY1,_buttonX2,_buttonY2) and mouse_check_button(mb_left)));
textSetup(fnMain,fa_center,fa_middle,c_black);
draw_text(_x,_y,_string);

drawReset();

if point_in_rectangle(mouse_x,mouse_y,_buttonX1,_buttonY1,_buttonX2,_buttonY2) and mouse_check_button_pressed(mb_left)
{
    groupSong = !groupSong;
}