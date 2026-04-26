//Draw Background
draw_sprite_ext(sprite_index,3,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha);

//Get Values
var _spriteWidth = 292;
var _spriteHeight = 41;
var _hpValue = (hp/maxHp)*_spriteWidth;

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

//Create Mask
var _maskXOffset = 5;
var _maskYOffset = 30;
if !surface_exists(barMask) then barMask = surface_create(_spriteWidth+_maskXOffset,sprite_height);
surface_set_target(barMask);
draw_clear_alpha(c_black,0);

//Add Effects To Health Bar
var _array = ds_map_keys_to_array(targetMap);
for (var i = 0; i < array_length(_array); i++) {
    
    //Effect
	var _effect = targetMap[? _array[i]];
    var _percent = struct_exists(_effect,"showValue") ? (_effect.showValue/100)*_spriteWidth : 0;
    
    //Get Last Value
    var _lastValue = 0;
    
    for (var k = 0; k < array_length(_array); k++) {
    	var _index = targetMap[? _array[k]];
        
        if _index.name != _effect.name and _index.type == _effect.type and k < i
        {
            _lastValue = struct_exists(_effect,"showValue") ? (_index.showValue/100)*_spriteWidth : 0;
        }
        
    }
    
    //Position
    var _newOffset = _effect.type == EFFECT_TYPE.HARM ? _hpValue + _lastValue : _lastValue;
    //var _barLeft = abs(_hpValue - _spriteWidth);
    
    var _bar = _effect.type == EFFECT_TYPE.HARM ? 
        new Vector2(
        _maskXOffset + lengthdir_x(_newOffset-1, angle) + lengthdir_x(_maskYOffset, angle - 90),
        lengthdir_y(_newOffset-1, angle) + lengthdir_y(_maskYOffset, angle - 90)) :
        new Vector2(
        _maskXOffset + lengthdir_x(_newOffset, angle) + lengthdir_x(_maskYOffset, angle - 90),
        lengthdir_y(_newOffset, angle) + lengthdir_y(_maskYOffset, angle - 90));
    
    
    draw_sprite_general(sprite_index,6,_xPos,_yPos,_percent,_spriteHeight,_bar.x,_bar.y,
    image_xscale, image_yscale, angle, _effect.color, _effect.color, _effect.color, _effect.color, image_alpha);
    
}

//Draw Surface
surface_reset_target();
draw_surface(barMask,_newX-_maskXOffset,_newY-_maskYOffset);

//Draw Cover
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha);

//Draw Title
var _titleNum = target == "Player" ? 1 : 2;
draw_sprite_ext(sprite_index,_titleNum,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha);
