//Draw Button
draw_self();

//Setup Text
textSetup(fnMain,fa_center,fa_middle);
var _textScale = 1 - textScaleOffset;
var _text = "Done";

//Draw Shadow
draw_set_colour(#323142);
draw_text_transformed(x+1,(y+2) + textYOffset,_text,_textScale,_textScale,0);

//Draw Text
draw_set_colour(c_white);
draw_text_transformed(x,y + textYOffset,_text,_textScale,_textScale,0);
