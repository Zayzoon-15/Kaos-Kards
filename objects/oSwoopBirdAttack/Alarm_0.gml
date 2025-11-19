///@desc Hit Player

//Effect
var _starOffset = 30;
starEffect(x,y,15,false,_starOffset,_starOffset);

//Hurt
hurtPlayer(value);

//Hit Effect
numberEffect(x,y,-value);

//Destroy
instance_destroy();