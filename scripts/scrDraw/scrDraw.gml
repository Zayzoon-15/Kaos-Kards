

///@self oCard
function drawCardText(_info){
    
    if !instance_exists(oCardText) and touchingMouse()
    {
        instance_create_depth(x,y,depth-1,oCardText,{ 
            name : _info.name,
            desc : _info.desc,
            range : _info.range,
            uses : variable_instance_exists(self,"uses") ? uses : NaN,
            type : info.type,
            parent : self.id
        });
    }
}


///@desc Creates a tip box that appears on top of the object
///Keep in mind every object that uses this function needs the variable: canHover
///@arg {string} _desc The description
///@arg {bool} _top Whether to draw at the top or bottom (Default: true)
///@arg {bool} _update If it should update each frame (Default: false) This would require the variable: tipBoxString 
///@arg {real} _distance The distance of the text (Default: 10)
///@arg {real} _size The size of the text (Default: 1)
function drawTipBox(_desc,_top = true,_update = false,_distance = 10,_size = 1){
    
    //Check If Has Variables
    if !variable_instance_exists(self.id,"canHover")
    {
        show_message($"{object_get_name(object_index)} does not have the variable: canHover");
        game_end();
    }
    
    if !variable_instance_exists(self.id,"tipBoxString") and _update
    {
        show_message($"{object_get_name(object_index)} does not have the variable: tipBoxString");
        game_end();
    }
    
    //Create Tip Box
    if !instance_exists(oTipBox) and touchingMouse()
    {	
        instance_create_depth(x,y,depth,oTipBox,{ 
            desc : _desc,
            parent : self.id,
            top : _top,
            distance : _distance,
            size : _size,
            update : _update
        });
    }
    
}


///@desc Draws a rectangle with an outline
///@arg {real} _x1 The x position of the top left corner
///@arg {real} _y1 The y position of the top left corner
///@arg {real} _x2 The x position of the bottom right corner
///@arg {real} _y2 The y position of the bottom right corner
///@arg {real} _cornerRad The radius of the curve (Default : UIBOX_RAD)
///@arg {real} _outlineWidth The width of the outline (Default : 1)
///@arg {Constant.Color} _bgColor The color of the box without an outline (Default : Black)
///@arg {Constant.Color} _outlineColor The color of the outline (Default : White)
///@arg {real} _bgAlpha The alpha of the box without an outline (Default : UIBOX_ALPHA)
///@arg {real} _outlineAlpha The alpha of the outline (Default : 1)
function drawRectOutlined(_x1,_y1,_x2,_y2,_cornerRad = UIBOX_RAD,_outlineWidth=1,_bgColor=c_black,_outlineColor=c_white,_bgAlpha = UIBOX_ALPHA,_outlineAlpha = 1)
{
    //Draw Bg
    draw_set_color(_bgColor);
    draw_set_alpha(_bgAlpha);
    draw_roundrect_ext(_x1,_y1,_x2,_y2,_cornerRad,_cornerRad,false);
    
    //Draw Outline
    draw_set_color(_outlineColor);
    draw_set_alpha(_outlineAlpha);
    //draw_roundrect_ext(_x1,_y1,_x2,_y2,_cornerRad,_cornerRad,true);
	
	//Outline Width
	for (var i = 0; i < _outlineWidth; ++i) {
		draw_roundrect_ext(_x1-i,_y1-i,_x2+i,_y2+i,_cornerRad+i,_cornerRad+i,true);
        
        if _outlineWidth > 1
        {
            draw_roundrect_ext(_x1-i/2,_y1-i/2,_x2+i/2,_y2+i/2,_cornerRad+i/2,_cornerRad+i/2,true);
        }
		
	}
    
    //Reset Stuff
    draw_set_alpha(1);
    draw_set_colour(c_white);
}


///@desc Creates text that alerts the player about anything
///@arg {string} _text The text to show
///@arg {real} _lifeSpan The life span of the text (Default : 30)
///@arg {real} _x The x position of the text (Default : room_width/2)
///@arg {real} _y The y position of the text (Default : 235)
function createAlertMessage(_text,_lifeSpan = 30,_x=room_width/2,_y=235)
{
	//Make Layer
	if !layer_exists("Ui") then layer_create(-1,"Ui");
	
	//Destroy Last Message
    if instance_exists(oAlertMessage) then instance_destroy(oAlertMessage);
    
	//Create Message
    instance_create_layer(_x,_y,"Ui",oAlertMessage,{
        text : _text,
        lifeSpan : _lifeSpan
    });
}



///@desc Makes a sprite with multiple animations in it to play as separate
///Make sure to have these variables: "frame", "animationEnd"
///@arg {real} _frame The animation frame
///@arg {real} _anims The amount of animations (Default = 4)
function spriteLoopFrames(_frame,_anims = 4)
{
    //Set Frame
    var _totalFrames = image_number / _anims;
    frame += sprite_get_speed(sprite_index)/60;
    
    //Loop Animation
    if frame >= _totalFrames
    {
        animationEnd = true;
        frame -= _totalFrames;
    } else animationEnd = false;
    
    //Update Sprte
    image_index = frame + (_frame*_totalFrames);
    image_index = clamp(image_index, 0, image_number-1);
}



/// @desc Draws a card with a 3d perspective
/// @param {real} _x The x position
/// @param {real} _y the y position
/// @param {asset.gmsprite} _front The front of the card
/// @param {asset.gmsprite} _back The back of the card
/// @param {real} _angle The rotation angle for the 3d effect
/// @param {real} _thickness The cards edge thickness (Default = 8)
/// @param {real} _imageblend The image blend for the card (Default = image_blend)
/// @param {real} _alpha The alpha of the card (Default = image_alpha)
function drawCard3d(_x, _y, _front, _back, _angle, _rot, _thickness = CARD_THICKNESS, _imageblend = image_blend, _alpha = image_alpha)
{
    if _angle != 0
    {
        //Function To Rotate The Card
        var _rotatePoint = function(_px, _py, _cx, _cy, _rot)
        {
            var _r = degtorad(-_rot);
            var _c = cos(_r);
            var _s = sin(_r);
            var _dx = _px - _cx;
            var _dy = _py - _cy;
            return [
                _cx + _dx*_c - _dy*_s,
                _cy + _dx*_s + _dy*_c
            ];
        };
    
        //Sprite Values
        var _spriteW = sprite_get_width(_front);
        var _spriteH = sprite_get_height(_front);
        var _halfW = _spriteW * 0.5;
        var _halfH = _spriteH * 0.5;
    
        //3d Flip
        var _scaleX = cos(degtorad(_angle));
    
        //Get Sprite To Draw
        var _sprite = (_scaleX >= 0) ? _front : _back;
        var _tex = sprite_get_texture(_sprite, 0);
    
        //Compute Card Corners Before Rotation
        var _x0 = _x - _halfW*_scaleX;
        var _y0 = _y - _halfH;
        var _x1 = _x + _halfW*_scaleX;
        var _y1 = _y - _halfH;
        var _x2 = _x + _halfW*_scaleX;
        var _y2 = _y + _halfH;
        var _x3 = _x - _halfW*_scaleX;
        var _y3 = _y + _halfH;
    
        //Apply Z Rotation
        var _p;
        _p = _rotatePoint(_x0,_y0,_x,_y,_rot); _x0=_p[0]; _y0=_p[1];
        _p = _rotatePoint(_x1,_y1,_x,_y,_rot); _x1=_p[0]; _y1=_p[1];
        _p = _rotatePoint(_x2,_y2,_x,_y,_rot); _x2=_p[0]; _y2=_p[1];
        _p = _rotatePoint(_x3,_y3,_x,_y,_rot); _x3=_p[0]; _y3=_p[1];
    
        //Draw Carrd
        draw_set_colour(_imageblend);
        draw_sprite_pos(_sprite,0,_x0,_y0, _x1,_y1, _x2,_y2, _x3,_y3,_alpha);
    
        //Edge Thickness
        var _edgeFactor = 1 - abs(_scaleX);
        if _edgeFactor <= 0.01 then return;
    
        //Check Which Side To Show
        var _showRight = (((_angle%360)+360)%360) < 180;
    
        //Edge UV Coordinates
        var _u0 = _showRight ? 1 : 0;
        var _u1 = _u0; 
        var _v0 = 0;
        var _v1 = 1;
    
        //Draw Edge As Triangle Strip
        draw_set_colour(_imageblend);
        draw_primitive_begin_texture(pr_trianglestrip, _tex);
    
        //Draw Edge
        for (var _i = 0; _i < _thickness; _i++)
        {
            var _offset = (_i/_thickness) * _edgeFactor * _thickness;
            var _baseX = _x + (_showRight ? _halfW*_scaleX : -_halfW*_scaleX);
            var _topY = _y - _halfH;
            var _botY = _y + _halfH;
    
            //Rotate Edge Vertices
            var _ptTop = _rotatePoint(_baseX, _topY, _x, _y, _rot);
            var _ptBot = _rotatePoint(_baseX, _botY, _x, _y, _rot);
    
            //Apply Offset Along Rotated Direction
            var _rangle = degtorad(-_rot);
            var _ox = cos(_rangle) * _offset * (_showRight ? 1 : -1);
            var _oy = sin(_rangle) * _offset * (_showRight ? 1 : -1);
    
            //Add Vertices To Primitive
            draw_vertex_texture(_ptTop[0]+_ox, _ptTop[1]+_oy, _u0, _v0);
            draw_vertex_texture(_ptBot[0]+_ox, _ptBot[1]+_oy, _u0, _v1);
        }
    
        draw_primitive_end();
    
        //Reset Draw
        drawReset();
    } else { //Draw If Angle Is Zero
    	
        draw_sprite_ext(_front,0,_x,_y,image_xscale,image_yscale,_rot,_imageblend,image_alpha);
        
    }
}


/// @desc Draws text with tags allowing you to change colors (Ex: "This text is [g]GREEN[/] and this one [b]BLUE[/]")
/// @param {real} _x The x position of the text
/// @param {real} _y The y position of the text
/// @param {string} _string The string
/// @param {real} [_maxWidth]=250 The max width of the text
/// @param {Constant.Color} [_boxColor]=#FF4C40 The box color for the tag [m]
/// @returns {real} The texts bottom position
function drawTextTagged(_x,_y,_string,_maxWidth = 250,_boxColor = #FF4C40)
{
    //Add Colors
    var _colorDefault = c_white;
    
    //Setup
    var _currentColor = _colorDefault;
    var _currentBox = false;
    var _currentSegment = "";
    var _segments = ds_list_create();
    var _length = string_length(_string);
    var i = 1;
    var _replaceText = false;
    
    
    //Change Text
    while (i <= _length) {
    	
        //Get Copy
        var _copy = string_copy(_string,i,1);
        
        if _copy == "["
        {
            //Get Substring
            var _subString = string_copy(_string,i,(_length-i)+1);
            var _pos = string_pos("]",_subString);
            
            if _pos > 0
            {
                //Get Tag
                var _tagEnd = (_pos+i)-1;
                var _tag = string_copy(_string,i,(_tagEnd-i)+1);
                
                //Set Segment
                if _currentSegment != ""
                {
                    //Change Part Of Segment To Math
                    var _addToVar = 0;
                    if string_pos("+",_currentSegment)
                    {
                        //Get Value
                        var _addPos = string_pos("+",_currentSegment);
                        _addToVar = real(string_copy(_currentSegment,_addPos+1,3));
                        
                        //Remove From Segment
                        _currentSegment = string_delete(_currentSegment,_addPos,4);
                    } else if string_pos("-",_currentSegment)
                    {
                        //Get Value
                        var _addPos = string_pos("-",_currentSegment);
                        _addToVar = -real(string_copy(_currentSegment,_addPos+1,3));
                        
                        //Remove From Segment
                        _currentSegment = string_delete(_currentSegment,_addPos,4);
                    }
                    
                    //Change Segment To Variable
                    if _replaceText and variable_global_exists(_currentSegment)
                    {
                        var _value = variable_global_get(_currentSegment);
                        if is_real(_value) then _value += _addToVar;
                        _currentSegment = string_format(_value,0,1);
                        _replaceText = false;
                    }
                    
                    //Add To Map
                    var _seg = ds_map_create();
                    _seg[? "text"] = _currentSegment;
                    _seg[? "color"] = _currentColor;
                    
                    if _currentBox then _seg[? "box"] = true;
                    
                    //Add Segment To Segments
                    ds_list_add(_segments,_seg);
                    _currentSegment = "";
                }
                
                //Change Based On Tag
                if _tag == "[r]"
                {
                    _currentColor = 4214015;
                    _currentBox = false;
                }
                else if _tag == "[g]"
                {
                    _currentColor = 8830261;
                    _currentBox = false;
                }
                else if _tag == "[b]"
                {
                    _currentColor = 16750080;
                    _currentBox = false;
                }
                else if _tag == "[lg]"
                {
                    _currentColor = c_ltgrey;
                    _currentBox = false;
                }
                else if _tag == "[p]"
                {
                    _currentColor = 13530270;
                    _currentBox = false;
                }
                else if _tag == "[aq]"
                {
                    _currentColor = 13281024;
                    _currentBox = false;
                }
                else if _tag == "[y]"
                {
                    _currentColor = 4502261;
                    _currentBox = false;
                }
                else if _tag == "[o]"
                {
                    _currentColor = 36863;
                    _currentBox = false;
                }
                else if _tag == "[m]"
                {
                    _currentColor = _colorDefault;
                    _currentBox = true;
                }
                else if _tag == "[/]"
                {
                    _currentColor = _colorDefault;
                    _currentBox = false;
                }
                else if _tag == "[s]"
                {
                    var _nlSeg = ds_map_create();
                    _nlSeg[? "newline"] = true;
                    ds_list_add(_segments,_nlSeg);
                }
                else if _tag == "[glo]"
                {
                    _replaceText = true;
                }
                
                //Continue
                i = _tagEnd + 1;
                continue;
            }
            
            
        }
        
        //Go To Next Segment
        _currentSegment += _copy;
        i ++;
    }
    
    
    if _currentSegment != ""
    {
        var _seg = ds_map_create();
        _seg[? "text"] = _currentSegment;
        _seg[? "color"] = _currentColor;
        
        if _currentBox then _seg[? "box"] = true;
        
        //Add Segment To Segments
        ds_list_add(_segments,_seg);
    }
    
    var _words = ds_list_create();
    
    //Go Through All Segments
    for (var s = 0; s < ds_list_size(_segments); s++) {
    	var _seg = ds_list_find_value(_segments,s);
        
        if ds_map_exists(_seg,"newline")
        {
            var _marker = ds_map_create();
            _marker[? "newline"] = true;
            ds_list_add(_words,_marker);
            ds_map_destroy(_seg);
        } else {
        	var _segText = _seg[? "text"];
        	var _segColor = _seg[? "color"];
            var _segBox = ds_map_exists(_seg,"box");
            var _wordArray = string_split(_segText," ");
            
            for (var j = 0; j < array_length(_wordArray); j++) {
            	var _wordText = _wordArray[j];
                
                if _wordText != ""
                {
                    var _wordMap = ds_map_create();
                    _wordMap[? "text"] = _wordText;
                    _wordMap[? "color"] = _segColor;
                    
                    if _segBox then _wordMap[? "box"] = true;
                    
                    ds_list_add(_words,_wordMap);
                }
                
                if j < array_length(_wordArray) - 1
                {
                    var _spaceMap = ds_map_create();
                    _spaceMap[? "text"] = " ";
                    _spaceMap[? "color"] = _segColor;
                    
                    if _segBox then _spaceMap[? "box"] = true;
                    
                    ds_list_add(_words,_spaceMap);
                }
            }
            
            ds_map_destroy(_seg);
        }
    }
    
    ds_list_destroy(_segments);
    var _line = ds_list_create();
    var _lineWidth = 0;
    var _lineHeight = string_height("A1gy");
    var _currentY = _y;
    
    var _drawLine = function(_line,_lineX,_lineY,_boxColor)
    {
        var _currentX = _lineX;
        
        for (var k = 0; k < ds_list_size(_line); k++) {
        	var _part = ds_list_find_value(_line,k);
            var _partText = _part[? "text"];
            var _partColor = _part[? "color"];
            
            if ds_map_exists(_part,"box")
            {
                var _textWidth = string_width(_partText);
                draw_set_colour(_boxColor);
                if _partText != " "
                {
                    draw_roundrect(_currentX-5,_lineY-2,_currentX+_textWidth+2,(_lineY+string_height("A1gy")),false);
                } else draw_rectangle(_currentX,_lineY-1,_currentX+_textWidth-1,(_lineY+string_height("A1gy")),false);
                
            }
            
            draw_set_colour(_partColor);
            draw_text(_currentX,_lineY,_partText);
            _currentX += string_width(_partText);
            ds_map_destroy(_part);
        }
    };
    
    for (var w = 0; w < ds_list_size(_words); w++) {
    	var _word = ds_list_find_value(_words,w);
        
        if ds_map_exists(_word,"newline")
        {
            trimLine(_line);
            _lineWidth = 0;
            
            for (var k = 0; k < ds_list_size(_line); k++) {
            	var _part = ds_list_find_value(_line,k);
                _lineWidth += string_width(_part[? "text"]);
            }
            
            if ds_list_size(_line) > 0
            {
                var _stratX = _x - (_lineWidth/2);
                _drawLine(_line,_stratX,_currentY,_boxColor);
            }
            
            ds_list_destroy(_line);
            _currentY += _lineHeight;
            _line = ds_list_create();
            _lineWidth = 0;
            ds_map_destroy(_word);
        } else {
        	var _wordText = _word[? "text"];
            var _wordWidth = string_width(_wordText);
            
            if (_lineWidth + _wordWidth) > _maxWidth and _lineWidth > 0
            {
                trimLine(_line);
                _lineWidth = 0;
                
                for (var k = 0; k < ds_list_size(_line); k++) {
                	var _part = ds_list_find_value(_line,k);
                    _lineWidth += string_width(_part[? "text"]);
                }
                
                var _startX = _x - (_lineWidth/2);
                _drawLine(_line,_startX,_currentY,_boxColor);
                ds_list_destroy(_line);
                _currentY += _lineHeight;
                _line = ds_list_create();
                _lineWidth = 0;
            }
            
            ds_list_add(_line,_word);
            _lineWidth += _wordWidth;
        }
    }
    
    if ds_list_size(_line) > 0
    {
        trimLine(_line);
        _lineWidth = 0;
        
        for (var k = 0; k < ds_list_size(_line); k++) {
        	var _part = ds_list_find_value(_line,k);
            _lineWidth += string_width(_part[? "text"]);
        }
        
        var _startX = _x - (_lineWidth/2);
        _drawLine(_line,_startX,_currentY,_boxColor);
    }
    
    //Destroy Stuff
    ds_list_destroy(_line);
    ds_list_destroy(_words);
    
    //Return Position
    return {
        x : _x,
        y : _currentY + _lineHeight,
        w : _lineWidth,
        h : abs(_y - (_currentY+_lineHeight))
    };
}



/// @desc Trims a text line (Mainly Used Only For drawTextTagged)
/// @param {id.dslist} _line The target line
function trimLine(_line)
{
    while (ds_list_size(_line)) > 0 {
    	var _first = ds_list_find_value(_line,0);
        
        if _first[? "text"] == " "
        {
            ds_map_destroy(_first);
            ds_list_delete(_line,0);
        } else break;
    }
    
    while (ds_list_size(_line)) > 0 {
    	var _lastIndex = ds_list_size(_line)-1;
        var _last = ds_list_find_value(_line,_lastIndex);
        
        if _last[? "text"] == " "
        {
            ds_map_destroy(_last);
            ds_list_delete(_line,_lastIndex);
        } else break;
    }
}