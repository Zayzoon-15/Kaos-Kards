//Draw Box
draw_self();

//Draw Menu Text
textSetup(fnMain,fa_center,fa_bottom);
draw_text_transformed(x,bbox_top-10,menuText,3,3,0);


//Draw Bar
var _rad = 3;
var _w = 5;
var _h = 30;
var _margin = 15;
var _x = bbox_right + 17;
var _y = ( bbox_top + 25 ) + ( (scroll/maxScrollDist) * ( (bbox_bottom - bbox_top) - 48 ) );

draw_roundrect_ext(_x-_margin/2,bbox_top,_x+_margin/2,bbox_bottom,_rad,_rad,true);
_x += 1;
draw_rectangle(_x-_w/2,_y-_h/2,_x+_w/2,_y+_h/2,false);
