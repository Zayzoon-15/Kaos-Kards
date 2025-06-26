///@desc Attack Target

if target == "Enemy"
{
    hurtEnemy(value);
} else hurtPlayer(value);

if target == "Enemy"
{
    with oEnemyHealth
    {
        numberHitEffect(x,y,other.value,false);
    }
} else { 
    with oPlayerHealth
    {
        numberHitEffect(x,y,other.value,false);
    }
}

if effectTime > 0
{
    alarm[0] = random_range(20,40);
} else instance_destroy();