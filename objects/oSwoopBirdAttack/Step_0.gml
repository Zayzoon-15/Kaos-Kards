if state == states.attackEnemy
{
	//Slow Down
    if place_meeting(x,y,oEnemyPhoto)
    {
        speed = lerp(speed,10,.3);
    } else speed = lerp(speed,startSpeed,.2);
}