if target == "Enemy"
{
    instance_create_layer(x,y+20,"Effects",oBreadDestroyed,{
        target : target,
        breadId : breadId
    });
    instance_destroy();
    
    other.shakeX = cardShake;
    other.shakeY = cardShake;
    
    numberHitEffect(other.x,other.y,value,false);
}

