//@desc Burn Card

with other
{
    //Hurt Effect
    cardHurt(other.value,true);
    
    //Nerf Card
    value -= other.value;
}

//Damage A Bit
if other.targetEnemy
{
    hurtPlayer(value/2,false,false);
} else {
    hurtEnemy(value/2,false,false);
}

//Destroy
instance_destroy();