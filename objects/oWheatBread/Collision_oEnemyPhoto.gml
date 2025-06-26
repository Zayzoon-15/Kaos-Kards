
if target == "Enemy"
{
    instance_create_layer(x,y,"Effects",oWheatBreadEffect,{
        image_angle : image_angle
    });
    
    hurtEnemy(damage);
    numberHitEffect(x,y,damage,false);
    
    //Audio
    audio_play_sound(snUhoh,0,false);
    
    //Destroy
    instance_destroy();
}