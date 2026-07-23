
//Draw Hold Time
if targetHoldTime > 0
{
    //Circle
    var _rad = 15;
    
    //Value
    var _value = (holdTime/targetHoldTime) * 100;
    holdValue = lerp(holdValue,_value,.2);
    
    //Draw Main
    drawCircularBar(mouse_x,mouse_y,holdValue,c_white,_rad,5);
    
    //Draw Outline
    drawCircularBar(mouse_x,mouse_y,holdValue,c_black,_rad-5,3);
    drawCircularBar(mouse_x,mouse_y,holdValue,c_black,_rad+2,3);
}