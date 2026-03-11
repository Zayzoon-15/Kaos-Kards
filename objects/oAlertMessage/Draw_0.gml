//Shake
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;
shake = lerp(shake,0,shakeEase);

//Text
textSetup(targetFont,fa_center,fa_middle,c_white,image_alpha);
draw_text_ext_transformed(x+_shakeX,y+_shakeY,text,-1,600,targetScale,targetScale,0);


//Reset Draw
drawReset();

