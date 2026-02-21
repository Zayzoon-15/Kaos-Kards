//Reflect Attack
var _list = ds_list_create();
var _collide = collision_rectangle_list(x-50,y-100,x+50,y+100,oParAttacks,false,true,_list,true);
ds_list_sort(_list,true);
if _collide
{
    for (var i = 0; i < ds_list_size(_list); i++) {
    	var _inst = ds_list_find_value(_list,i);
        
        //Stop If Ally
        if _inst.targetEnemy == targetEnemy then exit;
        
        //Stop If Not Damaging
        if !_inst.currentlyDamaging then exit;
        
        //Set Action
        var _action = function(){};
        
        //Reflect Inst
        with _inst
        {
            if !other.reflected
            {
                //Change Value
				var _multiplier = other.card.value * .5;
                other.card.value += card.value*_multiplier;
                other.card.value = clamp(other.card.value,1,99);
				
				//Tell Attack They Were Reflected
				reflected();
				
                //Action
                _action = card.card.info.action;
            }
        }
        
        with card
        {
            var _args = array_concat([other.targetEnemy],card.info.extraArgs);
            method_call(_action,_args);
        }
        
        //Destroy Inst
        instance_destroy(_inst);
        
        //Hurt Self
        if targetEnemy
        {
            hurtPlayer(value*.8);
        } else hurtEnemy(value*.8);
        
        //Juice
        card.cardJuice(true,false,true);
        card.cardFlash(.5,c_white);
        
        //Reflected
        reflected = true;
    }
}

//Destroy List
ds_list_destroy(_list);
