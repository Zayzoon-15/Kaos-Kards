
var _scale = 2;

//Box
var _width = 50*_scale;
var _height = 15*_scale;

var _rectX1 = x-_width;
var _rectX2 = x+_width;
var _rectY1 = y-_height;
var _rectY2 = y+_height;

//Clicking
if point_in_rectangle(mouse_x,mouse_y,_rectX1,_rectY1,_rectX2,_rectY2)
{
	canClick = true;
} else canClick = false;

//Hover
var _color = #191a19;
if canClick then _color = #2d2e2d;

//Draw Box
drawRectOutlined(_rectX1,_rectY1,_rectX2,_rectY2,UIBOX_RAD,_color,c_white,1);

//Draw Text
setupText(fnMain,fa_center,fa_middle);
var _string = $"{res[0]} x {res[1]}";

draw_text_transformed(x,y+2,_string,_scale,_scale,0);

//Draw Icon
if whole
{
	draw_sprite(sStars,0,x+_width+20,y);
	draw_sprite(sStars,0,x-_width-20,y);
}