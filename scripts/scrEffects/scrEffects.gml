


///@desc Spawns in multiple stars
///@arg {real} _x The x center position of the stars
///@arg {real} _y The y center position of the stars
///@arg {real} _amount The amount of stars to spawn (Default = 5)
///@arg {bool} _sound If it should play the star sound effect (Default = true)
///@arg {real} _xOffset The x offset of the effect (Default = 30)
///@arg {real} _yOffset The y offset of the effect (Default = 30)
///@arg {real} _width The width (Default = sprite_width)
///@arg {real} _height The height (Default = sprite_height)
function starEffect(_x,_y,_amount = 5,_sound = true,_xOffset = 30,_yOffset = 30,_width = sprite_width,_height = sprite_height)
{
    //Play Sound
    if _sound then audioPlaySfx([snStars1,snStars2]);
    
	//Set Amount
	_amount *= global.partAmount;
	
    //Loop
    for (var i = 0; i < _amount; i++) {
        		
		//Get Values
		var _effectX = (_width/2)-_xOffset;
		var _effectY = (_height/2)-_yOffset;
		
		//Get Offsets
		var _xOff = random_range(-_effectX,_effectX);
		var _yOff = random_range(-_effectY,_effectY);
        var _dir = sign(_xOff);
        
		//Create Effect
    	instance_create_layer(_x+_xOff,_y+_yOff,"Effects",oStarEffect,{
            dir : _dir
        });
    }
}



///@desc Creates a health effect
///@arg {real} _x The x center position of the effect
///@arg {real} _y The y center position of the effect
///@arg {real} _amount The amount of health to spawn (Default = 5)
///@arg {bool} _sound If it should play the heal sound effect (Default = true)
///@arg {real} _xOffset The x offset of the effect (Default = 30)
///@arg {real} _yOffset The y offset of the effect (Default = 30)
///@arg {real} _width The width (Default = sprite_width)
///@arg {real} _height The height (Default = sprite_height)
function healthEffect(_x,_y,_amount = 5,_sound = true,_xOffset = 30,_yOffset = 30,_width = sprite_width,_height = sprite_height)
{
    //Play Sound
    if _sound then audioPlaySfx(snHeal,.9,1.1);
    
	//Set Amount
	_amount *= global.partAmount;
	
    //Loop
    for (var i = 0; i < _amount; i++) {
        
		//Get Values
		var _effectX = (_width/2)-_xOffset;
		var _effectY = (_height/2)-_yOffset;
		
		//Get Offsets
		var _xOff = random_range(-_effectX,_effectX);
		var _yOff = random_range(-_effectY,_effectY);
        
		//Create Effect
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


///@desc Creates an explosion
///@arg {real} _x The x pos of the effect
///@arg {real} _y The y pos of the effect
///@arg {bool} _sound If it should play the explosion sound effect (Default = true)
///@arg {real} _scale The scale of the effect
function explosionEffect(_x,_y,_sound = true,_scale = 2)
{
	//Play Sound
	if _sound then audioPlaySfx(snExplosion,.9,1.1);
	
	//Create Explosion
    instance_create_layer(_x,_y,"Effects",oExplosionEffect, {
		image_xscale : _scale,
		image_yscale : _scale
	});
}