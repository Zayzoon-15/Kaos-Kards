///@desc Hurt Enemy
if canhurt and target == "Enemy"
{
    //Hurt
    hurtEnemy(damage);
    numberHitEffect(x,y,damage,false);
    
    //Effect
    shake += 30;
    
    //Slow Down
    spd = slowSpd;
    
    //Start Time
    canhurt = false;
    alarm[0] = 60;
}