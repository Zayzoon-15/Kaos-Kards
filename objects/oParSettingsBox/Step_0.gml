
//Ease
x = oSettingsSubMenu.x;
y = lerp(y,targetY,.2);
image_xscale = lerp(image_xscale,1,.15);
image_yscale = lerp(image_yscale,1,.15);
rectXScale = lerp(rectXScale,1,.15);
rectYScale = lerp(rectYScale,1,.15);

//Set Rectangle
rectX1 = (oSettingsSubMenu.bbox_left)+(width/rectXScale);
rectX2 = (oSettingsSubMenu.bbox_right)-(width/rectXScale);
rectY1 = y-(height*rectYScale);
rectY2 = y+(height*rectYScale);

//Set Hover
if point_in_rectangle(mouse_x,mouse_y,rectX1,y-height,rectX2,y+height) and !disabled
{
	//Juice
	if !hover and canHover then hoverJuice();
	
	//Set Hover
	hover = true;
} else hover = false;

//Fade Color
if hover
{
	rectAlpha = lerp(rectAlpha,1,.2);
} else rectAlpha = lerp(rectAlpha,0,.2);

//Clicked
if mouse_check_button_pressed(mb_left) and hover
{
	action();
}

//Condition
if struct_exists(info,"condition")
{
	disabled = info.condition();
}

//Reason
if struct_exists(info,"reason")
{
	reason = info.reason;
}