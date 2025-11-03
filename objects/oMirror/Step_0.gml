//Reflect Attack
var _list = ds_list_create();
var _collide = collision_circle_list(x,y,130,oParAttacks,false,true,_list,true);
ds_list_sort(_list,true);
if _collide
{
    for (var i = 0; i < ds_list_size(_list); i++) {
    	var _inst = ds_list_find_value(_list,i);
        
        //Stop If Ally
        if _inst.targetEnemy == targetEnemy then exit;
        
        if !_inst.currentlyDamaging then exit;
        
        //Reflect Inst
        with _inst
        {
            if !other.reflected
            {
                //Change Value
                other.card.value += value/3;
                
                //Action
                card.card.info.action(other.card.id,other.targetEnemy);
            }
        }
        
        //Destroy Inst
        instance_destroy(_inst);
        
        //Juice
        card.cardJuice(true,true,[10,15]);
        card.cardFlash();
        
        //Reflected
        reflected = true;
    }
}

//Destroy List
ds_list_destroy(_list);