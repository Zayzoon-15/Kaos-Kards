///@desc Destroy

//Stop If Attacks Are Still Going On
if instance_exists(oParAttacks)
{
	alarm[1] = 30;
	exit;
}

//Next Kaos
oKaosManager.alarm[0] = 50;

//Stars
starEffect(x,y,10,20,25);

//Destroy
instance_destroy();