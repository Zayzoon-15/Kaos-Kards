///@desc Destroy

//Next Kaos
oKaosManager.alarm[0] = 50;

//Stars
var _starX = (sprite_width/2)-20;
var _starY = (sprite_height/2)-25;
starEffect(x,y,10,-_starX,_starX,-_starY,_starY);

//Destroy
instance_destroy();