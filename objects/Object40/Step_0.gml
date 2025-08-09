///@desc Insert description here


if follow
{
	x = lerp(x,mouse_x,.2);
	y = lerp(y,mouse_y,.2);
} else
{
	x = lerp(x,xstart,.2);
	y = lerp(y,ystart,.2);
}

drawTipBox("DOES IT WORK?!");

var _angle = xprevious-x;
image_angle = lerp(image_angle,_angle,.3);