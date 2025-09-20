///@desc Hit Enemy
if state == states.attackEnemy
{
	//Hurt Enemy
	hurtEnemy(value);
	
	//Hit Effect
	numberEffect(x,y,-value);
	
	//Bread Effect
	instance_create_layer(x,y,"Effects",oBreadHitEffect,{
		hspeed : -2,
		image_xscale : image_xscale,
		image_yscale : image_yscale
	});
	
	//Destroy
	instance_destroy();
}