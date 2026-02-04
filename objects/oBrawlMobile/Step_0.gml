//Set Position
switch buttonType
{
	case "Left": x = getPosToWindow(false); break;
	case "Right": x = getPosToWindow(false); break;
	case "Punch": x = getPosToWindow(true); break;
	case "Jump": x = getPosToWindow(true); break;
}

//Touching
if touchId == -1
{
	for (var i = 0; i < 8; ++i) {
	    if position_meeting(device_mouse_x(i),device_mouse_y(i),id) and device_mouse_check_button(i,mb_any)
		{
			touchId = i;
			held = true;
			if type == "Press" {
				action();
				timeSourceCreate(5,function(){held = false},[],time_source_units_frames);
			}
		}
	}
} else {
	if device_mouse_check_button_released(touchId,mb_any) or !position_meeting(device_mouse_x(touchId),device_mouse_y(touchId),id)
	{
		touchId = -1;
		held = false;
	}
}

//Held
if held
{
	targetScale = .9;
	if type == "Hold" then action();
} else {
	targetScale = 1;
	if type == "Hold" then notHeld();
}

//Ease Scale
xscale = lerp_dt(xscale,targetScale,.2);
yscale = lerp_dt(yscale,targetScale,.2);

//Fade
if fade
{
	image_alpha = lerp_dt(image_alpha,0,.2);
}