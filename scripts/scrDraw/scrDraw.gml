

///@self oCard
function drawCardText(_info){
    
    if !instance_exists(oCardText) and touchingMouse()
    {
        instance_create_depth(x,y,depth,oCardText,{ 
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
///@arg {bool} _top whether to draw at the top or bottom
function drawTipBox(_desc,_top = true){
    
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
            top : _top
        });
    }
    
}


///@desc Draws a rectangle with an outline
///@arg {real} _x1 The x position of the top left corner
///@arg {real} _y1 The y position of the top left corner
///@arg {real} _x2 The x position of the bottom right corner
///@arg {real} _y2 The y position of the bottom right corner
///@arg {real} _cornerRad The radius of the curve (by default : 0)
///@arg {Constant.Color} _bgColor The color of the box without an outline (by default : Black)
///@arg {Constant.Color} _outlineColor The color of the outline (by default : White)
///@arg {real} _bgAlpha The alpha of the box without an outline (by default : 0.7)
///@arg {real} _outlineAlpha The alpha of the outline (by default : 1)
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



