//Go To Characters
x = playerInst.x + targetX;
y = playerInst.y + targetY;


//Hit Another Box (Characters Collide Attacks)
var _hurtbox = instance_place(x,y,oBrawlHurtBox);
if _hurtbox and _hurtbox.playerInst != playerInst
{
	//Push Players
	with oBrawlChar
	{
		knockBack -= 10 * dir;
	}
	
	//Audio
	audio_stop_sound(snWoosh);
	audioPlaySfx(snBrawlPunch);
	
	//Destroy Box
	instance_destroy(oBrawlHurtBox);
	
	//Exit Code
	exit;
}


//Hit Character
var _list = ds_list_create();
instance_place_list(x,y,oBrawlChar,_list,true);
for (var i = 0; i < ds_list_size(_list); ++i) {
    if _list[| i].id != playerInst
	{
		//Hit
		_list[| i].actHit();
		
		//Destroy
		instance_destroy();
	}
}

//Destroy List
ds_list_destroy(_list);
