

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
///@arg {bool} _top Whether to draw at the top or bottom (Default : true)
///@arg {real} _size The size of the text (Default: 1)
function drawTipBox(_desc,_top = true,_size = 1){
    
    //Check If Has Variable
    if !variable_instance_exists(self.id,"canHover")
    {
        show_message($"{object_get_name(object_index)} does not have the variable: canHover");
        game_end();
    }
    
    //Create Tip Box
    if !instance_exists(oTipBox) and touchingMouse()
    {
        instance_create_depth(x,y,depth,oTipBox,{ 
            desc : _desc,
            parent : self.id,
            top : _top,
            size : _size
        });
    }
    
}


///@desc Draws a rectangle with an outline
///@arg {real} _x1 The x position of the top left corner
///@arg {real} _y1 The y position of the top left corner
///@arg {real} _x2 The x position of the bottom right corner
///@arg {real} _y2 The y position of the bottom right corner
///@arg {real} _cornerRad The radius of the curve (Default : 0)
///@arg {Constant.Color} _bgColor The color of the box without an outline (Default : Black)
///@arg {Constant.Color} _outlineColor The color of the outline (Default : White)
///@arg {real} _bgAlpha The alpha of the box without an outline (Default : 0.7)
///@arg {real} _outlineAlpha The alpha of the outline (Default : 1)
function drawRectOutlined(_x1,_y1,_x2,_y2,_cornerRad = 0,_bgColor=c_black,_outlineColor=c_white,_bgAlpha = UIBOX_ALPHA,_outlineAlpha = 1)
{
    //Draw Bg
    draw_set_color(_bgColor);
    draw_set_alpha(_bgAlpha);
    draw_roundrect_ext(_x1,_y1,_x2,_y2,_cornerRad,_cornerRad,false);
    
    //Draw Outline
    draw_set_color(_outlineColor);
    draw_set_alpha(_outlineAlpha);
    draw_roundrect_ext(_x1,_y1,_x2,_y2,_cornerRad,_cornerRad,true);
    
    //Reset Stuff
    draw_set_color(c_white);
    draw_set_alpha(1);
}


///@desc Creates text that alerts the player about anything
///@arg {string} _text The text to show
///@arg {real} _x The x position of the text (Default : room_width/2)
///@arg {real} _y The y position of the text (Default : 60)
function createAlertMessage(_text,_x=room_width/2,_y=235)
{
    instance_create_layer(_x,_y,"Ui",oAlertMessage,{
        text : _text
    });
}



///@desc Makes a sprite with multiple animations in it to play as seprate
///Make sure to have these variables: "frame", "animationEnd"
///@arg {real} _dir The animation direction. Example (0 : first anim, 90 : second anim)
///@arg {real} _anims The amount of animations (Default = 4)
function loopMultAnims(_dir,_anims = 4)
{
    //Update Sprite
    var _directions = round(_dir/90);
    var _totalFrames = image_number / _anims;
    image_index = frame + (_directions*_totalFrames);
    frame += sprite_get_speed(sprite_index)/60;
    
    //Loop Animation
    if frame >= _totalFrames
    {
        animationEnd = true;
        frame -= _totalFrames;
    } else animationEnd = false;
}