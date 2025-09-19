///@desc Hit Player

//Effect
var _starX = (room_width/2)-10;
var _starY = (room_height/2)-15;
starEffect(room_width/2,room_height/2,35,-_starX,_starX,-_starY,_starY);

//Hurt
hurtPlayer(value);

//Destroy
instance_destroy();