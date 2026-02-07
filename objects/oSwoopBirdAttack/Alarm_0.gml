///@desc Hit Player

//Effect
var _starOffset = 30;
effectStar(x,y,15,false,_starOffset,_starOffset);

//Hurt
hurtPlayer(value);

//Hit Effect
effectNumber(x,y,-value);

//Destroy
instance_destroy();