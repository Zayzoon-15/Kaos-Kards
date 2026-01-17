
#region Set Position

//Set Correct Starting Point
x = room_width/2;
if targetEnemy
{
	y = -sprite_height;
} else y = room_height+sprite_height;

//Set Correct Target
var _offset = 200;
if targetEnemy
{
	targetX = x - _offset;
} else targetX = x + _offset;

#endregion

#region Get Card

//Get Correct List
var _list;
if targetEnemy
{
	_list = enemyActions;
} else _list = playerActions;

//Get Target Card
var _targetNum = 1;
targetCard = undefined;
while targetCard == undefined
{
	_targetNum = irandom_range(1,ds_list_size(_list)-1);
	targetCard = ds_list_find_value(_list,_targetNum);
}

#endregion

//Remove Card From List
ds_list_delete(_list,_targetNum);

//Set Sprite
sprite_index = targetCard.info.sprite;

//Destroy Self
alarm[0] = 60;
alarm[1] = 80;