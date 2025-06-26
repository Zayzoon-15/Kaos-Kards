
function playerAttackCard(_struct)
{
    instance_create_layer(639.5,791,"Cards",oAttackCard,{
        struct : _struct,
    })
}

function playerFlame(_value)
{
    cardJuice(true);
    var _newValue = _value * global.multiplier;
    
    addEffect("Enemy",_newValue*.2,_value*6);
    
    instance_create_layer(x,bbox_top-20,"Attacks",oAttackAce,{
        target : "Enemy",
        value : _newValue,
    });
    
}

function playerPoison(_value)
{
    cardJuice(true);
    var _newValue = _value * global.multiplier;
    
    addEffect("Enemy",_newValue*.4,_value*8);
}

function playerLaser(_value)
{
    var _cardId = id;
    var _newValue = _value * global.multiplier;
    instance_create_layer(x,bbox_top-5,"Attacks",oAttackLaser,{
        target : "Enemy",
        cardId : _cardId,
        value : _newValue,
    })
}

function playerHeal(_value)
{
    healthEffect(x,y,10);
    var _newValue = _value * global.multiplier;
    
    numberHitEffect(x,y,_newValue*1.5,true);
    
    healPlayer(_newValue*1.5);
    
    cardJuice(false);
}


function playerShield(_value)
{
    var _newValue = _value * global.multiplier;
    
    instance_create_layer(x,y,"Attacks",oShield,{
        target : "Enemy",
        value : _newValue
    });
    animateCard = true;
    alarm[1] = 60*2;
}

function playerBread(_value)
{
    var _xPos = x;
    var _newValue = _value * global.multiplier;
    
    cardJuice(true);
    
    for (var i = 0; i < 3; i++) 
    {
        
        var _xOffset = 0;
        var _yOffset = 40;
        var _maxDist = 45;
        
        switch (i) {
        	case 0:
                _xOffset = -_maxDist;
            break;
            
        	case 1:
                _xOffset = 0;
                _yOffset = 0;
            break;
            
        	case 2:
                _xOffset = _maxDist;
            break;
        }
        
    	instance_create_layer(_xPos + _xOffset,bbox_top,"Attacks",oAttackBread,{
            target : "Enemy",
            yOffset : _yOffset,
            breadId : i,
            value : _newValue,
        });
    }
    
}

function playerSlash(_value)
{
    animateCard = true;
    alarm[1] = 60*2;
    var _newValue = _value * global.multiplier;
    
    var _cardId = id;
    instance_create_layer(x,bbox_top-50,"Attacks",oAttackSlash,{
        target : "Enemy",
        cardId : _cardId,
        value : _newValue,
    });
}

function playerFreeze(_value)
{
    cardJuice(true);
    var _newValue = _value * global.multiplier;
    
    instance_create_layer(x,bbox_top-20,"Attacks",oAttackFreeze,{
        target : "Enemy",
        value : _newValue,
    });
    
}

function playerFist(_value)
{
    cardJuice(true);
    var _newValue = _value * global.multiplier;
    
    instance_create_layer(x,y-56,"Attacks",oAttackFist,{
        target : "Enemy",
        value : _newValue,
        cardId : struct.cardInfo.slotPlacement
    });
    
}



/*
function playerMirror(_value)
{
    var _newValue = (_value*global.multiplier)*.1;
    
    var _list = ds_list_create();
    var _num = collision_circle_list(x, y, 100, oParAttacks, false, true, _list, false);
    if (_num > 0)
    {
        for (var i = 0; i < _num; ++i;)
        {
            var _inst = _list[| i];
            show_message(_inst);
            with _inst
            {
                target = "Enemy";
                value = _newValue;
                mirrorMove();
                instance_destroy();
            }
            cardJuice(true);
            canMirror = false;
        }
    }
    ds_list_destroy(_list);
}