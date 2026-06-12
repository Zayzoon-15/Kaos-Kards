

///@desc Spawns in multiple stars
///@arg {real} _x The x center position of the stars
///@arg {real} _y The y center position of the stars
///@arg {real} _amount The amount of stars to spawn (Default = 5)
///@arg {bool} _sound If it should play the star sound effect (Default = true)
///@arg {real} _xOffset The x offset of the effect (Default = 30)
///@arg {real} _yOffset The y offset of the effect (Default = 30)
///@arg {real} _width The width (Default = sprite_width)
///@arg {real} _height The height (Default = sprite_height)
///@arg {string} _layer The layer to make the effect on (Default = "Effects")
///@arg {real} _depthOveride The depth of the effect (Default = undefined)
function effectStar(_x,_y,_amount = 5,_sound = true,_xOffset = 30,_yOffset = 30,_width = sprite_width,_height = sprite_height,_layer = "Effects",_depthOveride = undefined)
{
    //Play Sound
    if _sound then audioPlaySfx([snStars1,snStars2],1,1,1,1,.04);
    
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
    	var _inst = instance_create_layer(_x+_xOff,_y+_yOff,_layer,oEffectStar,{
            dir : _dir
        });
        
        //Depth Overide
        if _depthOveride != undefined then _inst.depth = _depthOveride;	
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
///@arg {string} _layer The layer to make the effect on (Default = "Effects")
///@arg {real} _depthOveride The depth of the effect
function effectHealth(_x,_y,_amount = 5,_sound = true,_xOffset = 30,_yOffset = 30,_width = sprite_width,_height = sprite_height,_layer = "Effects",_depthOveride = undefined)
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
		var _inst = instance_create_layer(_x+_xOff,_y+_yOff,_layer,oEffectHealth);
    
        //Depth Overide
        if _depthOveride != undefined then _inst.depth = _depthOveride;	
    }
}


///@desc Creates a number hit effect
///@arg {real} _x The x pos of the effect
///@arg {real} _y The y pos of the effect
///@arg {real} _value The number to show
///@arg {string} _layer The layer to make the effect on (Default = "Effects")
///@arg {real} _depthOveride The depth of the effect
function effectNumber(_x,_y,_value,_layer = "Effects",_depthOveride = undefined)
{
    var _inst = instance_create_layer(_x,_y,_layer,oEffectNum,{
        value : _value
    });
    
    //Depth Overide
    if _depthOveride != undefined then _inst.depth = _depthOveride;
}


///@desc Creates a text sprite effect
///@arg {real} _x The x pos of the effect
///@arg {real} _y The y pos of the effect
///@arg {Asset.GMSprite} _sprite TThe sprite
///@arg {string} _layer The layer to make the effect on (Default = "Effects")
///@arg {real} _depthOveride The depth of the effect
function effectTextSprite(_x,_y,_sprite = sSkipped,_layer = "Effects",_depthOveride = undefined)
{
    var _inst = instance_create_layer(_x,_y,_layer,oEffectSkipped,{
        sprite_index : _sprite
    });
    
    //Depth Overide
    if _depthOveride != undefined then _inst.depth = _depthOveride;
}


///@desc Creates an explosion
///@arg {real} _x The x pos of the effect
///@arg {real} _y The y pos of the effect
///@arg {bool} _sound If it should play the explosion sound effect (Default = true)
///@arg {real} _scale The scale of the effect
///@arg {string} _layer The layer to make the effect on (Default = "Effects")
///@arg {real} _depthOveride The depth of the effect
function effectExplosion(_x,_y,_sound = true,_scale = 2,_layer = "Effects",_depthOveride = undefined)
{
	//Play Sound
	if _sound then audioPlaySfx(snExplosion,.9,1.1);
	
	//Create Explosion
    var _inst = instance_create_layer(_x,_y,_layer,oEffectExplosion, {
		image_xscale : _scale,
		image_yscale : _scale
	});
    
    //Depth Overide
    if _depthOveride != undefined then _inst.depth = _depthOveride;
}

///@desc Spawns in multiple ball particles
///@arg {real} _x The x center position of the balls
///@arg {real} _y The y center position of the balls
///@arg {real} _amount The amount of balls to spawn (Default = 5)
///@arg {real} _radius The radius of balls (Default = 5)
///@arg {real} _xOffset The x offset of the effect (Default = 30)
///@arg {real} _yOffset The y offset of the effect (Default = 30)
///@arg {real} _width The width (Default = sprite_width)
///@arg {real} _height The height (Default = sprite_height)
///@arg {string} _layer The layer to make the effect on (Default = "Effects")
///@arg {real} _depthOveride The depth of the effect
function effectCircles(_x,_y,_amount = 5,_radius = 5,_xOffset = 30,_yOffset = 30,_width = sprite_width,_height = sprite_height,_layer = "Effects",_depthOveride = undefined)
{
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
    	var _inst = instance_create_layer(_x+_xOff,_y+_yOff,_layer,oEffectCircles,{
            dir : _dir,
            rad : _radius
        });
        
        //Depth Overide
        if _depthOveride != undefined then _inst.depth = _depthOveride;
    }
}