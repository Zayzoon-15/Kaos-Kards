

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

