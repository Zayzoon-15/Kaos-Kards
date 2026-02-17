///@desc Round Over

//Attacks Exists
var _attcksExists = instance_exists(oParAttacks);
with oAttackEffect
{
	if info.type == EFFECT_TYPE.HARM then _attcksExists = true;
}

//Loop Again If There Are Attacks Left
if _attcksExists
{
	alarm[3] = 60;
	exit;
}

//Round Over Message
createAlertMessage("Round Over",30,room_width/2,(room_height/2)-60);
audioPlaySfx(snRoundEnd);

//Set Kaos Over
kaosOver = true;

//Create Button
alarm[4] = 30;