///@desc Attack Enemy Create Event

//Set Position
x = -10;
y = random_range(room_height/2,room_height);

//Get Direction
var _enemyMargin = 40;
var _enemyX = random_range(-_enemyMargin,_enemyMargin);
var _enemyY = random_range(-_enemyMargin,_enemyMargin);
direction = point_direction(x,y,oEnemyPhoto.x+_enemyX,oEnemyPhoto.y+_enemyY);
image_angle = direction;

//Speed
startSpeed = 35;
speed = startSpeed;

//Hit
hitPhoto = false;