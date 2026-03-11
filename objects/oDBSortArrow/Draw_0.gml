//Draw Button
draw_self();

//Setup Scale
var _scale = 1 - arrowScaleOffset;

//Draw Shadow
draw_sprite_ext(sDBSortArrow,0,x+1,y+2+arrowYOffset,_scale,_scale,arrowAngle,c_black,image_alpha*.6);

//Draw Arrow
draw_sprite_ext(sDBSortArrow,0,x,y + arrowYOffset,_scale,_scale,arrowAngle,c_white,image_alpha);