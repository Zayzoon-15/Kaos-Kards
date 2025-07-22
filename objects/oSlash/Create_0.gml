
//Set Right Direction
if targetEnemy then image_yscale = 1; else image_yscale = -1;


//Attack
attack = function()
{
    //Card Effect
    with instance_place(x,y,oAttackCard) {cardHurt(value);}
    
    //Damage
    if targetEnemy
    {
        hurtEnemy(value);
    } else hurtPlayer(value);
}