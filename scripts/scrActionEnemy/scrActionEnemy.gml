
function enemyAttackCard(_struct)
{
    instance_create_layer(639.5,-71,"Cards",oEnemyAttackCard,{
        struct : _struct,
    })
}

function enemyBread(_value)
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
        
    	instance_create_layer(_xPos + _xOffset,bbox_bottom,"Attacks",oAttackBread,{
            target : "Player",
            yOffset : _yOffset,
            breadId : i,
            value : _newValue,
        });
    }
}

function enemyFlame(_value)
{
    cardJuice(true);
    var _newValue = _value * global.multiplier;
    
    addEffect("Player",_newValue*.2,_value*6);
    
    instance_create_layer(x,bbox_bottom+20,"Attacks",oAttackAce,{
        target : "Player",
        value : _newValue,
    });
}

function enemyLaser(_value)
{
    var _cardId = id;
    var _newValue = _value * global.multiplier;
    instance_create_layer(x,bbox_bottom+5,"Attacks",oAttackLaser,{
        target : "Player",
        cardId : _cardId,
        value : _newValue,
    })
}

function enemyHeal(_value)
{
    healthEffect(x,y,10);
    var _newValue = _value * global.multiplier;
    
    numberHitEffect(x,y,_newValue,true);
    
    healEnemy(_newValue);
    
    cardJuice(false);
}

function enemySlash(_value)
{
    animateCard = true;
    alarm[1] = 60*2;
    
    var _newValue = _value * global.multiplier;
    
    var _cardId = id;
    instance_create_layer(x,bbox_bottom+50,"Attacks",oAttackSlash,{
        target : "Player",
        cardId : _cardId,
        value : _newValue,
    });
}

function enemyShield(_value)
{
    var _newValue = _value * global.multiplier;
    instance_create_layer(x,y,"Attacks",oShield,{
        target : "Player",
        value : _newValue
    });
    animateCard = true;
    alarm[1] = 60*2;
}

function enemyFreeze(_value)
{
    cardJuice(true);
    var _newValue = _value * global.multiplier;
    
    instance_create_layer(x,bbox_bottom+20,"Attacks",oAttackFreeze,{
        target : "Player",
        value : _newValue,
    });
}

function enemyPoison(_value)
{
    cardJuice(true);
    var _newValue = _value * global.multiplier;
    
    addEffect("Player",_newValue*.4,_value*8);
}

function enemyFist(_value)
{
    cardJuice(true);
    var _newValue = _value * global.multiplier;
    
    instance_create_layer(x,y+56,"Attacks",oAttackFist,{
        target : "Player",
        value : _newValue,
        cardId : struct.cardInfo.slotPlacement
    });
}


/*
function enemyMirror(_value)
{
    var _newValue = (_value*global.multiplier)*.1;
    cardJuice(true);
    
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
                target = "Player";
                value = _newValue;
                mirrorMove();
            }
        }
    }
    ds_list_destroy(_list);
}