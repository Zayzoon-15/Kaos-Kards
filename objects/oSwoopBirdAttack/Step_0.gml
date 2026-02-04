
if state == states.attackEnemy
{
	//Slow Down
    if place_meeting(x,y,oEnemyPhoto)
    {
        speed = lerp_dt(speed,10,.3);
    } else speed = lerp_dt(speed,startSpeed,.2);
}