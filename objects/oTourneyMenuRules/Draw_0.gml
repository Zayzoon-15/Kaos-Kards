draw_self();

//Draw Rules For Now
textSetup(fnMain,fa_left,fa_top,c_black);
draw_text_ext_transformed(bbox_left + 65,y+50,ruleString,-1,170,1,1,0);

//Reset
drawReset();