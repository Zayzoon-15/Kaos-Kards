///@desc Hit Enemy
if state == states.attackEnemy
{
    //Hit Photo
    if hitPhoto then exit; else hitPhoto = true;
    
	//Hurt Enemy
	hurtEnemy(value);
	
	//Hit Effect
	effectNumber(x,y,-value);
}