///@desc Attack Enemy Create Event

//Set Position
x = 0;
y = room_height;

//Set Size
setSize(2);

//Get Direction
direction = point_direction(x,y,oEnemyPhoto.x,oEnemyPhoto.y);
image_angle = direction;

//Speed
speed = 45;