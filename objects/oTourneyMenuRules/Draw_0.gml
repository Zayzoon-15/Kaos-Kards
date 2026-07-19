draw_self();

//Draw Rules For Now
textSetup(fnMain,fa_left,fa_top);
draw_text_ext_transformed(bbox_left + 70,y+40,ruleString,-1,150,1,1,0);

//Reset
drawReset();