//Draw Outer Circle
draw_circle(x,y,maxRad,true);

//Draw Inner Circle
draw_set_colour(c_black);
draw_set_alpha(.5);
draw_circle(x,y,rad,false);

//Reset
drawReset();