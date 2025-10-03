
if dragging and mouse_check_button_released(mb_left)
{
	dragging = false;
}

if dragging
{
	//No Hover
	canHover = false;
	
	//Get Rectangle
	var _x1 = x+(width/rectXScale);
	var _x2 = rectX2-(width/rectXScale);
	var _width = abs(_x2 - _x1);
	
	//Change Value
	if mouse_x > _x1
	{
	
		var _x = abs(_x1-mouse_x);
		var _amount = _x / _width;
		currentAmount = _amount*100;
	
	} else currentAmount = 0;
	
} else canHover = true;