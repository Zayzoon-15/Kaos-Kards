
#region Get And Remove Target Card

//Get Target List
var _list = targetEnemy ? enemyActions : playerActions;

//Get New List
var _newList = ds_list_create();
ds_list_copy(_newList,_list);

//Cancel Combo
ds_list_set(_list,0,false);

//Remove First Entry (Combo Entry)
ds_list_delete(_newList,0);

//Remove Any Undefined Values
while ds_list_find_index(_newList,undefined) != -1
{
    ds_list_delete(_newList,ds_list_find_index(_newList,undefined));
}

//List Is Empty
if ds_list_is_empty(_newList)
{
    //Show Message
    createAlertMessage($"{targetEnemy ? "Enemy" : "Player"} Has No Cards Played",60);
    
    //Destroy List
    ds_list_destroy(_newList);
    
    //Destroy Self
    instance_destroy();
    timeSourceCreate(1,eventKaosCardDone);
    
    //Exit Code
    exit;
}

//Get Target card
targetCard = ds_list_get_random(_newList);

//Remove Card From List
ds_list_delete(_list,ds_list_find_index(_list,targetCard));

//DEBUG TEST
print($"REMOVED A CARD FROM {targetEnemy ? "ENEMY" : "PLAYER"}",$"TARGET CARD: {targetCard.info.name}");

//Set Sprite
sprite_index = targetCard.info.sprite;

//Destroy List
ds_list_destroy(_newList);

#endregion

//Intro Animation
TweenEasyMove(x,targetEnemy ? -sprite_height : SCREEN_HEIGHT + sprite_height,x,ROOM_CENTER.y,0,18,EaseOutBack);

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