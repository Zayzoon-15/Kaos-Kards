if canPress and !global.midTrans and !locked and !global.showCards
{
    with oEnemySelect
    {
        if selected 
        {
            selected = false;
        }
    }
    
    selected = !selected;
    
    targetEnemy = enemy;
    
    starEffect(x,y,10,-120,120,-120,120);
    
    audio_play_sound(snButtonPress2,0,false);
    
    setSize(1.5,1.5);
}

if !global.midTrans and locked and !global.showCards
{
    shake += 5;
    audio_play_sound(snDeny,0,false);
}