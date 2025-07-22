


///@desc Spawns in multiple stars
///@arg {real} _x The x center position of the stars
///@arg {real} _y The y center position of the stars
///@arg {real} _amount The amount of stars to spawn (Default = 5)
///@arg {real} _xMin The min amount the stars can move on the x axis (Default = -30)
///@arg {real} _xMax The max amount the stars can move on the x axis (Default = 30)
///@arg {real} _yMin The min amount the stars can move on the y axis (Default = -30)
///@arg {real} _yMax The max amount the stars can move on the y axis (Default = 30)
function starEffect(_x,_y,_amount = 5,_xMin = -30,_xMax = 30,_yMin = -30,_yMax = 30)
{
    for (var i = 0; i < _amount; i++) {
        
        randomize();
        var _xOffset = random_range(_xMin,_xMax);
        var _yOffset = random_range(_yMin,_yMax);
        var _dir = sign(_xOffset);
        
    	instance_create_layer(_x+_xOffset,_y+_yOffset,"Effects",oStarEffect,{
            dir : _dir
        });
    }
}



///@desc Creates a health effect
///@arg {real} _x The x center position of the effect
///@arg {real} _y The y center position of the effect
///@arg {real} _amount The amount of health to spawn (Default = 5)
///@arg {real} _xMin The min amount the effect can move on the x axis (Default = -30)
///@arg {real} _xMax The max amount the effect can move on the x axis (Default = 30)
///@arg {real} _yMin The min amount the effect can move on the y axis (Default = -30)
///@arg {real} _yMax The max amount the effect can move on the y axis (Default = 30)
function healthEffect(_x,_y,_amount = 5,_xMin = -30,_xMax = 30,_yMin = -30,_yMax = 30)
{
    for (var i = 0; i < _amount; i++) {
        
        randomize();
        var _xOffset = random_range(_xMin,_xMax);
        var _yOffset = random_range(_yMin,_yMax);
        
    	instance_create_layer(_x+_xOffset,_y+_yOffset,"Effects",oHealthEffect);
    }
}


///@desc Creates a number hit effect
///@arg {real} _x The x pos of the effect
///@arg {real} _y The y pos of the effect
///@arg {real} _value The number to show
function numberEffect(_x,_y,_value)
{
    instance_create_layer(_x,_y,"Effects",oNumEffect,{
        value : _value
    });
}