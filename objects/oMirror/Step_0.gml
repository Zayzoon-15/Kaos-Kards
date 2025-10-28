
//Ease Alpha
image_alpha = lerp(image_alpha,1,.08);

//Ease Size
image_xscale = lerp(image_xscale,1.3,.1);
image_yscale = lerp(image_yscale,1.3,.1);

//Reflect Attack
var _list = ds_list_create();
var _collide = collision_circle_list(x,y,50,oParAttacks,false,true,_list,true);
if _collide
{
	var _inst = ds_list_find_value(_list,0);
	print("Inst",_inst)
	if !_inst.reflected
	{
		card.cardJuice(true,true);

		_inst.reflected = true;
		_inst.hitOthers = false;
		with _inst.card
		{
			card.info.action(other.card.id,other.targetEnemy);
		}
		print("Reflect",_inst);
	}
}

ds_list_destroy(_list); //Destroy List