//Depth
depth = -1;

//Draw Background
draw_sprite_ext(sprite_index,3,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha);

//Get Values
var _spriteWidth = 292;
var _spriteHeight = 41;
var _hpValue = (hp/100)*_spriteWidth;
var _hitStunValue = (hitStun/100)*_spriteWidth;

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

//Draw Hit Stun
//draw_sprite_general(sprite_index,6,_xPos,_yPos,_hitStunValue,_spriteHeight,_newX,_newY,
//image_xscale, image_yscale, angle, image_blend, image_blend, image_blend, image_blend, image_alpha);

for (var i = 0; i < ds_list_size(targetList); i++) {
    
    var _list = ds_list_find_value(targetList,i);
    
    var _lastList = undefined;
    var _lastValue = 0;
    
    for (var k = 0; k < ds_list_size(targetList); k++) {
        var _foundList = ds_list_find_value(targetList,k);
    	if _foundList.info.type == _list.info.type and _foundList.info != _list.info and k > i
        {
            _lastList = _foundList;
        }
    }
    
    if _lastList != undefined
    {
        if _lastList.info.type == _list.info.type
        {
            _lastValue = _lastList.showPercent;
        }
    }
    
    var _newOffset = 0;
    
    var _color = _list.info.color;
    
    var _barX = x + lengthdir_x(_offsetX+_newOffset, angle) + lengthdir_x(_offsetY, angle - 90);
    var _barY = y + lengthdir_y(_offsetX+_newOffset, angle) + lengthdir_y(_offsetY, angle - 90);
    
    
	draw_sprite_general(sprite_index,6,_xPos,_yPos,_list.percent,_spriteHeight,_barX,_barY,
    image_xscale, image_yscale, angle, _color, _color, _color, _color, .5);
}

//Draw Health
draw_sprite_general(sprite_index,4,_xPos,_yPos,_hpValue,_spriteHeight,_newX,_newY,
image_xscale, image_yscale, angle, image_blend, image_blend, image_blend, image_blend, image_alpha);

//Draw Effects
//for (var i = 0; i < ds_list_size(targetList); i++) {
    //
    //var _list = ds_list_find_value(targetList,i);
    //
    //var _lastList = undefined;
    //var _lastValue = 0;
    //
    //for (var k = 0; k < ds_list_size(targetList); k++) {
        //var _foundList = ds_list_find_value(targetList,k);
    	//if _foundList.info.type == _list.info.type and _foundList.info != _list.info and k < i
        //{
            //_lastList = _foundList;
        //}
    //}
    //
    //if _lastList != undefined
    //{
        //if _lastList.info.type == _list.info.type
        //{
            //_lastValue = _lastList.showPercent;
        //}
        //
    //}
    //
    //var _newOffset = (_lastValue/(100))*(_spriteWidth);
    //var _barValue = (_list.showPercent/(100))*(_spriteWidth);
    //var _color = _list.info.color;
    //
    //_barValue += 1;
    //
    //var _barXOffset = 40;
    //
    //var _barX = x + lengthdir_x(_offsetX+_newOffset, angle) + lengthdir_x(_offsetY, angle - 90);
    //var _barY = y + lengthdir_y(_offsetX+_newOffset, angle) + lengthdir_y(_offsetY, angle - 90);
    //
    //
	//draw_sprite_general(sprite_index,6,_barXOffset,38,_barValue,_spriteHeight,_barX,_barY,
    //image_xscale, image_yscale, angle, _color, _color, _color, _color, image_alpha);
//}


//Draw Cover
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha);

//Draw Title
var _titleNum = 1;
if target != "Player" then _titleNum = 2;
draw_sprite_ext(sprite_index,_titleNum,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha);
