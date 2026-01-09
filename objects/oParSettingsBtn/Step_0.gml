//Get Positions
var _x = instance_exists(oSettingsSubMenu) ? oSettingsSubMenu.x : x;
var _y = instance_exists(oSettingsSubMenu) ? oSettingsSubMenu.bbox_top + 60 : ystart;

//Seperate Buttons
_y += btnId * 100;
ystart = _y;

//Ease
x = _x;
y = lerp(y,ystart + targetY,.15);
textScaleX = lerp(textScaleX,textTargetScale,.15);
textScaleY = lerp(textScaleY,textTargetScale,.15);
rectXScale = lerp(rectXScale,1,.15);
rectYScale = lerp(rectYScale,1,.15);

//Set Rectangle
if instance_exists(oSettingsSubMenu)
{
    rectX1 = (oSettingsSubMenu.bbox_left)+(width*rectXScale);
    rectX2 = (oSettingsSubMenu.bbox_right)-(width*rectXScale);
    rectY1 = y-(height*rectYScale);
    rectY2 = y+(height*rectYScale);
}

//Set Hover
if point_in_rectangle(mouse_x,mouse_y,rectX2,y-height,rectX1,y+height) and !disabled
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

//Check If Disabled
if disableCheck != undefined
{
    disabled = disableCheck();
}