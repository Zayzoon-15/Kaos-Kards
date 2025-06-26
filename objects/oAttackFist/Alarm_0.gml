///@desc Hurt

//Effect
if !place_meeting(x,y,[oAttackCard,oEnemyAttackCard])
{
    var _y = bbox_top + (50*dir);
    starEffect(x,_y,20,-70,70,-5,5);
    numberHitEffect(x,_y,value,false);
}


if target == "Player"
{
    hurtPlayer(value);
} else hurtEnemy(value);