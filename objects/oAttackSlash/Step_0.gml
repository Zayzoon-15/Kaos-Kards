if image_index == 10
{
    if target == "Enemy"
    {
        hurtEnemy(value);
    } else hurtPlayer(value); 
}

if !place_meeting(x,y,[oAttackCard,oEnemyAttackCard]) and image_index == 10
{
    if target == "Enemy"
    {
        numberHitEffect(x,bbox_top + 30,value,false);
    } else numberHitEffect(x,bbox_top - 30,value,false);
}