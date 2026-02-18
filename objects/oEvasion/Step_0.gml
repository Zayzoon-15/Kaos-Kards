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
        if (!_inst.currentlyDamaging) { exit;}
        else if (_inst.currentlyDamaging && got_hit_chance >= min(value,20)) { exit;} // miss chance
		
        //Destroy Inst
        instance_destroy(_inst);
        
        //Juice
        card.cardJuice(true,false,true);
        card.cardFlash(.5,c_white);
        
        //Reflected
		dodged = true;
    }
}

//Destroy List
ds_list_destroy(_list);