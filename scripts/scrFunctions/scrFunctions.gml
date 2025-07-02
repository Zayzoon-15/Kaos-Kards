
///@desc Sets the size of the object to the given values
///@arg {real} _x The x scale
///@arg {real} _y The y scale
function setSize(_x,_y)
{
    image_xscale = _x;
    image_yscale = _y;
}


///@desc Checks if the mouse is touching the given instance
///@arg {Asset.GMObject} _inst The instance to check (by default: self)
function touchingMouse(_inst = self)
{
    if position_meeting(mouse_x,mouse_y,_inst)
    {
        return true;
    } else return false;
}

///@desc Sets up the text values
///Keep in mind you do need to reset everything after wards
///@arg {Asset.GMFont} _font The font
///@arg {Constant.HAlign} _halign The horizontal alignment
///@arg {Constant.VAlign} _valign The vertical alignment
///@arg {Constant.Color} _color The color (by default : White)
///@arg {real} _alpha The alpha (by default : 1)
function setupText(_font,_halign,_valign,_color=c_white,_alpha=1)
{
    draw_set_font(_font);
    draw_set_halign(_halign);
    draw_set_valign(_valign);
    draw_set_color(_color);
    draw_set_alpha(_alpha)
}


///@desc Resets all draw values
function resetDraw()
{
    draw_set_color(c_white);
    draw_set_alpha(1);
}