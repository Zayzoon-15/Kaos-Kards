
//Reduce Shake
shake = lerp(shake,0,.2);

//Goto Enemy
if target == "Enemy"
{
    image_xscale = -1;
    speed = spd;
}

if target == "Player"
{
    image_xscale = lerp(image_xscale,4*imageDir,.15);
    image_yscale = lerp(image_yscale,4,.15);
    
    if image_yscale >= 3.5
    {
        starEffect(x,y,25);
        numberHitEffect(x,y,damage,false);
        hurtPlayer(damage);
        instance_destroy();
    }
}