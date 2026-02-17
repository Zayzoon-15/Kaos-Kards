///@desc Attack

//Create Bread
instance_create_layer(0,0,"Effects",oSwoopBreadAttack,{
	targetEnemy : targetEnemy,
	value : irandom_range(5,10)
});

//Destroy
alarm[1] = 60;