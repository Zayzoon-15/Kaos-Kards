if target == "Player"
{
    //Not My First Time
    global.breadFirst = false;
    
    //Stars
    starEffect(x,y,20,-300,300,-300,300);
    
    //Audio
    audio_play_sound(snUhoh,0,false);
    
    //Hurt
    hurtPlayer(damage);
    numberHitEffect(x,y,damage,false);
    
    //Destroy
    instance_destroy();
}
