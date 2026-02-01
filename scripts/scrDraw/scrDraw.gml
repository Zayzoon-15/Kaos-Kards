

///@self oCard
function drawCardText(_info){
    
    if !instance_exists(oCardText) and touchingMouse()
    {
        instance_create_depth(x,y,depth-1,oCardText,{ 
            name : _info.name,
            desc : _info.desc,
            range : _info.range,
            uses : uses,
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
		//draw_roundrect_ext(_x1-i/2,_y1-i/2,_x2+i/2,_y2+i/2,_cornerRad+i/2,_cornerRad+i/2,true);
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
    //Update Sprite
    var _totalFrames = image_number / _anims;
    image_index = frame + (_frame*_totalFrames);
    frame += sprite_get_speed(sprite_index)/60;
    
    //Loop Animation
    if frame >= _totalFrames
    {
        animationEnd = true;
        frame -= _totalFrames;
    } else animationEnd = false;
}


///@desc Plays the enemy animation
///@param {string} _anim The animation to play
function enemyPlayAnim(_anim)
{
    //Animation Does Not Exist
    if !variable_struct_exists(global.currentEnemy.animInfo,_anim)
    {
        print($"'{_anim}' Does Not Exist")
        exit;
    }
    
    //Set clip
    var _clip = variable_struct_get(global.currentEnemy.animInfo, _anim);
    
    //Switch Animation
    with oEnemyPhoto
    {
        if _clip != undefined and currentAnim != _clip
        {
            currentAnim = _clip;
            frame = 0;
            animationEnd = false;
        }
    }
}


/// @desc Draws a card with a 3d perspective
/// @param {real} _x The x position
/// @param {real} _y the y position
/// @param {asset.gmsprite} _front The front of the card
/// @param {asset.gmsprite} _back The back of the card
/// @param {real} _angle The rotation angle for the 3d effect
/// @param {real} _thickness The cards edge thickness
function drawCard3d(_x, _y, _front, _back, _angle, _rot, _thickness, _imageblend = image_blend, _alpha = 1)
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
}

