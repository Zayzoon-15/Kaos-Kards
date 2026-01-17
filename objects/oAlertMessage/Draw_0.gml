//Shake
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-1,1)*shake;
shake = lerp(shake,0,.2);

//Text
textSetup(fnMain,fa_center,fa_middle,c_white,image_alpha);
draw_text_ext_transformed(x+_shakeX,y+_shakeY,text,-1,600,2,2,0);


//Reset Draw
drawReset();

