//Pause
if keyCheckPressed(global.keyPause) and !global.midTrans and !array_contains(disabledRooms,room)
{
	if global.paused
	{
		destroySettings();
	} else createSettings();
}

//Mobile Position
mobilePos.x = getPosToWindow(false,41);
mobilePos.y = 678;

//Clicked Mobile
if !global.paused and global.mobile and !array_contains(disabledRooms,room)
{
    if point_in_circle(mouse_x,mouse_y,mobilePos.x,mobilePos.y,mobileRad)
    {	
    	if mouse_check_button_pressed(mb_left)
    	{
    		mobilePressed = true;
    	}
    	
    	if mouse_check_button_released(mb_left)
    	{
    		if mobilePressed then createSettings();
    		mobilePressed = false;
    	}
    } else mobilePressed = false;
} else mobilePressed = false;