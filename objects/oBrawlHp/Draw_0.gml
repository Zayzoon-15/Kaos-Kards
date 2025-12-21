//Draw Bg
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);


//Bar Values
var _x = x - 54 * dir;
var _y = y - 20;
var _width = (hp / 100) * sprite_get_width(spriteBar)-4;

//Draw Bar
draw_sprite_general(spriteBar,0,0,0,_width,16,_x,_y,1*dir,1,0,c_white,c_white,c_white,c_white,image_alpha);

//Draw Lil Bar
var _lilBarX = _x+(_width-4)*dir;
draw_sprite_general(spriteBar,0,sprite_get_width(spriteBar)-8,0,8,16,_lilBarX,_y,1*dir,1,0,c_white,c_white,c_white,c_white,image_alpha);

//Draw Container
draw_self();

//Draw Stick Guy
var _shakeX = random_range(-1,1)*shake;
var _shakeY = random_range(-.4,.4)*shake;
draw_sprite_ext(sprite_index,2,x+_shakeX,y+_shakeY,1,1,0,c_white,image_alpha);
