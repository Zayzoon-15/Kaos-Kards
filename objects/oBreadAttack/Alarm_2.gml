///@desc Trail

var _dir;

if targetEnemy then _dir = 1; else _dir = -1;

instance_create_layer(x,y,"Effects",oBreadTrial,{
    dir : _dir
});

alarm[2] = 5;