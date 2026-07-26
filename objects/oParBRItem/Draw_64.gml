
//Draw Hold Time
if targetHoldTime > 0
{
    //Circle
    var _rad = 15;
    
    //Value
    var _value = (holdTime/targetHoldTime) * 100;
    holdValue = lerp(holdValue,_value,.2);
    
    //Position
    var _x = device_mouse_x_to_gui(0);
    var _y = device_mouse_y_to_gui(0);
    
    //Draw Main
    drawCircularBar(_x,_y,holdValue,c_white,_rad,5);
    
    //Draw Outline
    drawCircularBar(_x,_y,holdValue,c_black,_rad-5,3);
    drawCircularBar(_x,_y,holdValue,c_black,_rad+2,3);
}