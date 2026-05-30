//Draw Bg
draw_set_colour(c_black);
draw_set_alpha(.7);
draw_rectangle(SCREEN_EDGE.left,0,SCREEN_EDGE.right,SCREEN_HEIGHT,false);

//Draw Flash
drawReset();
draw_self();

#region Draw Text

//Setup
var _dist = 40;
var _scale = 3;

//Top Text
textSetup(fnMain,fa_center,fa_bottom);
draw_text_transformed(x,bbox_top - _dist,"You Got Uhhh...",_scale,_scale,0);

#endregion