if target == "Player" and canHurt
{
    other.shakeX = cardShake;
    other.shakeY = cardShake;

    starEffect(other.x,other.y,20,-60,60,-90,90);
    numberHitEffect(other.x,other.y,value,false);
    
    canHurt = false;
}