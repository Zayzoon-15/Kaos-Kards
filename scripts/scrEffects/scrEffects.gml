

function starEffect(_x,_y,_amount = 5,_xMin = -30,_xMax = 30,_yMin = -30,_yMax = 30)
{
    
    for (var i = 0; i < _amount; i++) {
        
        randomize();
        var _xOffset = random_range(_xMin,_xMax);
        var _yOffset = random_range(_yMin,_yMax);
        var _dir = sign(_xOffset);
        
    	instance_create_layer(_x+_xOffset,_y+_yOffset,"Effects",oStars,{
            dir : _dir
        });
    }
}


function healthEffect(_x,_y,_amount = 10,_xMin = -40,_xMax = 40,_yMin = -50,_yMax = 50)
{
    for (var i = 0; i < _amount; i++) {
        
        randomize();
        var _xOffset = random_range(_xMin,_xMax);
        var _yOffset = random_range(_yMin,_yMax);
        var _dir = sign(_xOffset);
        
    	instance_create_layer(_x+_xOffset,_y+_yOffset,"Effects",oHealthEffect,{
            dir : _dir
        });
    }
}

function snowflakeEffect(_x,_y,_amount = 3,_dir = 1,_xMin = -40,_xMax = 40,_yMin = -50,_yMax = 50)
{
    for (var i = 0; i < _amount; i++) {
        
        randomize();
        var _xOffset = random_range(_xMin,_xMax);
        var _yOffset = random_range(_yMin,_yMax);
        
    	instance_create_layer(_x+_xOffset,_y+_yOffset,"Effects",oSnowflake,{
            dir : _dir
        });
    }
}

function numberHitEffect(_x,_y,_value,_add = true)
{
    instance_create_layer(_x,_y,"Effects",oNumberHurt,{
        value : _value,
        add : _add
    });
}

function explosionEffect(_x,_y,_size = 1)
{
    instance_create_layer(_x,_y,"Effects",oExplosion, {
        targetSize : _size,
    });
}