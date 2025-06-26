//Position
targetX = x;
targetY = y;
startingX = x;

//Shadow
shadowX = 0;
shadowY = 0;
shadowSize = 0;

//Set Sprite
var _struct = ds_list_find_value(playersActions,cardId);
sprite_index = _struct.cardInfo.sprite;

alarm[0] = 60;