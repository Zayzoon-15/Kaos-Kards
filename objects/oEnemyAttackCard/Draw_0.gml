//Shake
randomize();
var _xDir = random_range(-1,1);
var _yDir = random_range(-1,1);
var _shakeX = _xDir*shakeX;
var _shakeY = _yDir*shakeY;
shakeX = lerp(shakeX,0,.3);
shakeY = lerp(shakeY,0,.3);
finalShake = {
    x : _shakeX,
    y : _shakeY,
    xDir : _xDir,
    yDir : _yDir
};

//Draw Shadow
draw_sprite_ext(sprite_index, image_index, x+shadowX+_shakeX, y+shadowY+_shakeY, image_xscale-shadowSize, image_yscale-shadowSize, image_angle, c_black, .7);

//Draw Self
draw_sprite_ext(sprite_index, image_index, x+_shakeX, y+_shakeY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);