//Draw Bg
draw_set_colour(c_black);
draw_set_alpha(.7 * image_alpha);
draw_rectangle(SCREEN_EDGE.left,0,SCREEN_EDGE.right,SCREEN_HEIGHT,false);

//Draw Flash
drawReset();
draw_self();

#region Draw Text

//Setup
textSetup(fnMain,fa_center,fa_bottom,c_white,image_alpha);
var _dist = 40;
var _scale = 3;
var _textNorm = "You Got  ";
var _textWave = "Uhhh...";
var _textCombinedWidth = string_width(_textNorm + _textWave) * _scale;

//Got Text
draw_text_transformed(x - (string_width(_textWave)*_scale)/2,bbox_top - _dist,_textNorm,_scale,_scale,0);

//Uhhh Text
draw_text_wave_transformed(x + (string_width(_textNorm)*_scale)/2,bbox_top - _dist,_textWave,string_width(_textWave),3,0.003,_scale,_scale);

//Reset Draw
drawReset();

#endregion