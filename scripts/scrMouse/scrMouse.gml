
function touchingMouse(_inst = self)
{
    if position_meeting(mouse_x,mouse_y,_inst)
    {
        return true;
    } else return false;
}