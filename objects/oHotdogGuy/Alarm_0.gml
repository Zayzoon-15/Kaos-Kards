///@desc Create Click Me's

//Should Not Create
if !oHotdog.gameStarted then exit;

//Create Click
var _margin = new Vector2(150,200);
var _x = irandom_range(CAMERA_POS.x - _margin.x,SCREEN_WIDTH - _margin.x);
var _y = irandom_range(CAMERA_POS.y - _margin.y,SCREEN_HEIGHT - _margin.y);
instance_create_depth(_x,_y,depth - 5, oHotdogClick);

//Start Again
alarm[0] = random_range(1,10);