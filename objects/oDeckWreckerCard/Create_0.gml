//Get Target List
var _list = targetEnemy ? enemyActions : playerActions;

//Get Target Card
if !ds_list_empty(_list)
{
	var _targetNum = 1;
	targetCard = undefined;
	while targetCard == undefined
	{
		_targetNum = irandom_range(1,ds_list_size(_list)-1);
		targetCard = ds_list_find_value(_list,_targetNum);
	}
	
	print("OLD LIST");
	ds_debug_print(_list,ds_type_list);
	
	//Remove Card From List
	ds_list_delete(_list,_targetNum);
	
	//DEBUG TEST
	print($"REMOVED A CARD FROM {targetEnemy ? "ENEMY" : "PLAYER"}",$"TARGET INDEX: {_targetNum}");
	if targetEnemy
	{
		ds_debug_print(enemyActions,ds_type_list);
	} else ds_debug_print(playerActions,ds_type_list);

	//Set Sprite
	sprite_index = targetCard.info.sprite;
}

//Intro Animation
TweenEasyMove(x,targetEnemy ? SCREEN_HEIGHT + sprite_height : -sprite_height,x,ROOM_CENTER.y,0,18,EaseOutBack);

//Start Rip Animation
alarm[0] = 50;

//Set Rip Values
ripOneY = 0;
ripOneAng = 0;
ripTwoY = 0;
ripTwoAng = 0;

//Draw card ripped
drawCardRip = function(_xPos = x,_yPos = y,_ang = 0,_left = 0,_top = 0,_width = sprite_width,_height = sprite_height,_blend = image_blend,_alpha = image_alpha,_xscale = 1, _yscale = 1)
{
    
	var _angle = _ang + image_angle;
    var _x = _left - sprite_get_xoffset(sprite_index);
    var _y = _top - sprite_get_yoffset(sprite_index);
    var _c = dcos(_angle);
    var _s = dsin(_angle);
    draw_sprite_general(
        sprite_index,0, 
        _left,_top,
        _width,_height,
        (x+_c*_x+_s*_y)+_xPos,
        (y-_s*_x+_c*_y)+_yPos,
        _xscale,_yscale,
        _angle,
        _blend,_blend,_blend,_blend,_alpha 
    );
    
}