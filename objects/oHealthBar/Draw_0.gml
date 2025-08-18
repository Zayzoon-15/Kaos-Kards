//Depth
depth = -1;

//Draw Background
draw_sprite_ext(sprite_index,3,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha);

//Get Values
var _spriteWidth = 292;
var _spriteHeight = 41;
var _hpValue = (hp/100)*_spriteWidth;
var _shieldValue = (tempHP/100)*_spriteWidth;
var _poisonValue = (50/100)*_spriteWidth;

//Flip Values
var _xPos,_yPos;
if flipped
{
    _xPos = 14;
    _yPos = 38;
} else {
	_xPos = 40;
    _yPos = 38;
}

//Get Offsets
var _offsetX = _xPos-sprite_xoffset;
var _offsetY = _yPos-sprite_yoffset;
var _newX = x + lengthdir_x(_offsetX, angle) + lengthdir_x(_offsetY, angle - 90);
var _newY = y + lengthdir_y(_offsetX, angle) + lengthdir_y(_offsetY, angle - 90);

//Draw Health
draw_sprite_general(sprite_index,4,_xPos,_yPos,_hpValue,_spriteHeight,_newX,_newY,
image_xscale, image_yscale, angle, image_blend, image_blend, image_blend, image_blend, image_alpha);

//Draw Temp Health
draw_sprite_general(sprite_index,5,40,38,_shieldValue,_spriteHeight,_newX,_newY,
image_xscale, image_yscale, angle, image_blend, image_blend, image_blend, image_blend, image_alpha);

//Draw Cover
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha);

//Draw Title
var _titleNum = 1;
if target != "Player" then _titleNum = 2;
draw_sprite_ext(sprite_index,_titleNum,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha);


/*
//Draw Effects
draw_sprite_general(sprite_index,5,40,38,_value,_spriteHeight,_newX,_newY,
image_xscale, image_yscale, angle, _color, _color, _color, _color, image_alpha);