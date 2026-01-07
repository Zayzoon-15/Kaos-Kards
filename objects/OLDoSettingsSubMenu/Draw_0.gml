//Draw Box
draw_self();

//Draw Text
textSetup(fnMain,fa_center,fa_bottom);
draw_text_transformed(x,bbox_top+5,currentMenu,4,4,0);

//Reset Draw
drawReset();