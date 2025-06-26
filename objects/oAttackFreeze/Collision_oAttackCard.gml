
if target == "Player"
{
    instance_destroy();
    
    other.shakeX = cardShake;
    other.shakeY = cardShake;
    
    numberHitEffect(other.x,other.y,value,false);
}