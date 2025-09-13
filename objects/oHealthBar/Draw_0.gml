//Depth
depth = -1;

//Draw Background
draw_sprite_ext(sprite_index,3,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha);

//Get Values
var _spriteWidth = 292;
var _spriteHeight = 41;
var _hpValue = (hp/100)*_spriteWidth;

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

for (var i = 0; i < ds_list_size(targetList); i++) {
    
    var _list = ds_list_find_value(targetList,i);
	
	_list.healthInst = self.id;
	
    var _lastList = undefined;
    var _lastValue = 0;
    
    for (var k = 0; k < ds_list_size(targetList); k++) {
        var _foundList = ds_list_find_value(targetList,k);
    	if _foundList.info.type == _list.info.type and _foundList.info != _list.info and k < i
        {
            _lastList = _foundList;
        }
    }
    
    if _lastList != undefined
    {
        if _lastList.info.type == _list.info.type
        {
            _lastValue = _lastList.percent;
        }
    }
	
	//if flipped then _xPos -= 1; else _xPos += 1;
    var _newOffset,_value,_barX,_barY;
	var _color = _list.info.color;
	
	if _list.info.type == EFFECT_TYPE.HARM
	{
    _newOffset = _hpValue+_lastValue;
    var _barLeft = abs(_hpValue-_spriteWidth);
    
	_value = _list.value;
	if _value < 0 then _value = 0;
	
	_list.percent = (_value/100)*_spriteWidth;
    
    _barX = _maskXOffset + lengthdir_x(_newOffset-1, angle) + lengthdir_x(_maskYOffset, angle - 90);
    _barY = lengthdir_y(_newOffset-1, angle) + lengthdir_y(_maskYOffset, angle - 90);
	} else {
	
	_newOffset = _lastValue;
    
	_value = _list.showPercent;
	if _value < 0 then _value = 0;
	
	_list.percent = (_value/100)*_spriteWidth;
    
    _barX = _maskXOffset + lengthdir_x(_newOffset, angle) + lengthdir_x(_maskYOffset, angle - 90);
    _barY = lengthdir_y(_newOffset, angle) + lengthdir_y(_maskYOffset, angle - 90);
	}
    
	draw_sprite_general(sprite_index,6,_xPos,_yPos,_list.percent,_spriteHeight,_barX,_barY,
    image_xscale, image_yscale, angle, _color, _color, _color, _color, image_alpha);
}

//Draw Surface
surface_reset_target();
draw_surface(barMask,_newX-_maskXOffset,_newY-_maskYOffset);

//Draw Cover
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha);

//Draw Title
var _titleNum = 1;
if target != "Player" then _titleNum = 2;
draw_sprite_ext(sprite_index,_titleNum,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha);
