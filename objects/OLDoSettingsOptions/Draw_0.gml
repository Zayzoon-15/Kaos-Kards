//Inherit
event_inherited();

//Set Alpha Based On Disabled
var _alpha = 1;
if disabled then _alpha = .5;

//Draw Selections
textSetup(fnMain,fa_center,fa_middle,c_white,_alpha);
draw_text_transformed(opCenter,y,$"< {options[currentSelection].text} >",opXScale*image_xscale,opYScale*image_yscale,0);

//Reset
drawReset();