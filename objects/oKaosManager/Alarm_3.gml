///@desc Round Over

//Loop Again If There Are Attacks Left
if instance_exists(oParAttacks)
{
	alarm[3] = 60;
	exit;
}

//Round Over Message
createAlertMessage("Round Over",room_width/2,(room_height/2)-60);

//Create Button
alarm[4] = 30;