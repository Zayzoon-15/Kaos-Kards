

///@self oCard
function drawCardText(_info){
    
    if !instance_exists(oCardText) and touchingMouse()
    {
        instance_create_depth(x,y,depth-1,oCardText,{ 
            name : _info.name,
            desc : _info.desc,
            range : _info.range,
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
	}
    
    //Reset Stuff
    draw_set_color(c_white);
    draw_set_alpha(1);
}


///@desc Creates text that alerts the player about anything
///@arg {string} _text The text to show
///@arg {real} _x The x position of the text (Default : room_width/2)
///@arg {real} _y The y position of the text (Default : 235)
function createAlertMessage(_text,_x=room_width/2,_y=235)
{
    if instance_exists(oAlertMessage) then instance_destroy(oAlertMessage);
    
    instance_create_layer(_x,_y,"Ui",oAlertMessage,{
        text : _text
    });
}



///@desc Makes a sprite with multiple animations in it to play as seprate
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