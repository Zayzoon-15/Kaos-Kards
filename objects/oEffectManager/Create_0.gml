
//Create Lists
globalvar playerEffects,enemyEffects;
playerEffects = ds_list_create();
enemyEffects = ds_list_create();


function addEffect(_effect,_value)
{
    var _struct = {info:_effect,value:_value,percent:_value,showPercent:0};
    
    for (var i = 0; i < ds_list_size(playerEffects); i++) {
    	if ds_list_find_value(playerEffects,i).info == _struct.info
        {
            _struct = ds_list_find_value(playerEffects,i);
            _struct.value += _value;
            _struct.percent += _value;
            ds_list_delete(playerEffects,i);
            ds_list_insert(playerEffects,i,_struct);
            exit;
        }
    }
    
    ds_list_insert(playerEffects,0,_struct);
}


function changeEffectAmount(_effect,_amount)
{
    for (var i = 0; i < ds_list_size(playerEffects); i++) {
        var _struct = ds_list_find_value(playerEffects,i);
        _struct.percent += _amount;
        ds_list_replace(playerEffects,i,_struct);
    }
    
}

#region DEBUG

show_debug_log(true);

dbg_view("Effects",true,30,30,250,300);

buttons = [
{string:"Shield",action:function(){addEffect(attackEffects.shield,10);}},
{string:"Poison",action:function(){addEffect(attackEffects.poison,10);}},
{string:"Fire",action:function(){addEffect(attackEffects.fire,10);}},
{string:"Piss",action:function(){addEffect(attackEffects.pee,10);}},
{string:"Add",action:function(){changeEffectAmount(attackEffects.shield,10);}},
{string:"Remove",action:function(){changeEffectAmount(attackEffects.shield,-10);}},
{string:"Heal",action:function(){healPlayer(10)}},
{string:"Hurt",action:function(){hurtPlayer(10)}},
];

for (var i = 0; i < array_length(buttons); i++) 
{dbg_button(buttons[i].string, buttons[i].action);}

#endregion