//Draw Pause
if global.paused
{
    //Draw Screenshot
    if screenshot != undefined
    {
        draw_sprite(screenshot,0,SCREEN_EDGE.left,0);
    }
    
    //Setup Values
    var _offset = 5;
    var _x1 = SCREEN_EDGE.left + _offset;
    var _y1 = _offset;
    var _x2 = SCREEN_EDGE.right - _offset;
    var _y2 = SCREEN_HEIGHT-_offset;
    
    //Draw Rectangle
    drawRectOutlined(_x1,_y1,_x2,_y2,0,_offset);
    
    //Reset Draw
    drawReset();
    
} else { //Draw Mobile Button
    if global.mobile and !global.paused and !array_contains(disabledRooms,room)
    {
    	//Draw Circle
    	draw_set_colour(c_gray);
    	draw_set_alpha(.5);
    	draw_circle(mobilePos.x,mobilePos.y,mobileRad,false);
    	
    	//Draw Mobile Icon
    	drawReset();
    	draw_sprite(sMobilePause,0,mobilePos.x,mobilePos.y);
    }
}