//Draw Bg
draw_set_colour(c_black);
draw_set_alpha(.9 * image_alpha);
draw_rectangle(SCREEN_EDGE.left,0,SCREEN_EDGE.right,SCREEN_HEIGHT,false);

//Rotate
if canInteract then targetAngle -= angleSpd;
image_angle = lerp(image_angle,targetAngle,.1);

//Draw Flash
drawReset();
draw_self();

#region Draw Text

//Setup
textSetup(fnMain,fa_center,fa_bottom,c_white,image_alpha);
var _dist = 250;
var _scale = 3 * image_yscale;
var _textNorm = special ? "You Got  " : "You Got Cards!";
var _textWave = special ? "Uhhh..." : "";
var _textCombinedWidth = string_width(_textNorm + _textWave) * _scale;

//Got Text
draw_text_transformed(x - (string_width(_textWave)*_scale)/2,y - _dist,_textNorm,_scale,_scale,0);

//Uhhh Text
if string_length(_textWave) > 1
{
    draw_text_wave_transformed(x + (string_width(_textNorm)*_scale)/2,y - _dist,_textWave,string_width(_textWave),3,0.003,_scale,_scale);
}

//Reset Draw
drawReset();

#endregion