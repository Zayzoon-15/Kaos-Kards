///@desc Round Over

if instance_exists(oParAttacks)
{
	alarm[3] = 60;
	exit;
}

instance_create_depth(x,y,depth,oKaosRoundOver);