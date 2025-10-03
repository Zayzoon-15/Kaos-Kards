//Inherit
event_inherited();

var _x1 = x+(width/rectXScale);
var _x2 = rectX2-(width/rectXScale);
var _y1 = y-((height/2)*rectYScale);
var _y2 = y+((height/2)*rectYScale);
var _fillOffset = 10;

var _value = (currentAmount / maxAmount) * 100;

draw_healthbar(_x1+_fillOffset,_y1+_fillOffset,_x2-_fillOffset,_y2-_fillOffset,_value,c_black,c_white,c_white,0,false,false);
drawRectOutlined(_x1,_y1,_x2,_y2,UIBOX_RAD,2,c_black,c_white,0,1);