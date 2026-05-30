//Get Positions
var _top = CAMERA_POS.y;
var _bottom = SCREEN_HEIGHT;
var _right = SCREEN_EDGE.right;
var _left = SCREEN_EDGE.left;

//Draw Bg Color
draw_set_colour(#403F4C);
draw_rectangle(_left,_top,_right,_bottom,false);
draw_set_colour(c_white);

//Draw Brick Wall
draw_sprite_stretched(sHotdogBrick,0,_left,_top,SCREEN_WIDTH,SCREEN_HEIGHT);

//Draw Floorr
draw_sprite_stretched(sHotdogFloor,0,_left,_top,SCREEN_WIDTH,SCREEN_HEIGHT);

//Draw Lights
draw_sprite_stretched(sHotdogLights,0,_left,_top,SCREEN_WIDTH,SCREEN_HEIGHT);

//Draw Banner
draw_sprite(sHotdogBanner,0,0,0);

//DRAW TABLE FOR NOW
draw_sprite(sHotdogTable,0,0,0);