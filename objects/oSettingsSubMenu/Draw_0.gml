//Draw Box
draw_self();

//Draw Menu Text
textSetup(fnMain,fa_center,fa_bottom);
draw_text_transformed(x,bbox_top-10,menuText,3,3,0);


//Draw Bar
var _boxRad = 5;
var _buttonRad = 5;
draw_roundrect_ext(scrollBoxRect.one.x,scrollBoxRect.one.y,scrollBoxRect.two.x,scrollBoxRect.two.y,_boxRad,_boxRad,true);
scrollBoxX += .3;
updateScrollBox();
draw_roundrect_ext(scrollBoxX-scrollBoxW/2,scrollBoxY-scrollBoxH/2,scrollBoxX+scrollBoxW/2,scrollBoxY+scrollBoxH/2,_buttonRad,_buttonRad,false);