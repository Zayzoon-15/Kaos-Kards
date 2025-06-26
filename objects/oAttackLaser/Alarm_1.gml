///@desc Hurt

value *= .7;
value = round(value);

if target == "Enemy"
{
    hurtEnemy(value);
} else hurtPlayer(value);

randomize();
var _x = x+random_range(-30,30);
var _y = y-random_range(80,130);

with oAttackCard
{
    if id == other.cardId and other.target == "Enemy"
    {
        numberHitEffect(_x,_y,other.value,false);
    }
}

with oEnemyAttackCard
{
    if id == other.cardId and other.target == "Player"
    {
        numberHitEffect(_x,_y,other.value,false);
    }
}


if sprite_index == sLaser
{
    alarm[1] = 30;
    hurting = true;
} else hurting = false;
