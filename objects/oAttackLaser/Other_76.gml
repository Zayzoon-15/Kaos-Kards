if (event_data[? "event_type"] == "sprite event")
{
    switch (event_data[? "message"])
    {
        case "laserStartBig":
            
            //Sound
            audio_play_sound(snLazer,0,false);
            
            //Animate Card
            with oAttackCard
            {
                if id == other.cardId and other.sprite_index == sLaserStart and other.target == "Enemy"
                {
                    setSize(image_xscale+.5,image_yscale+.5);
                }
            }
        
            with oEnemyAttackCard
            {
                if id == other.cardId and other.sprite_index == sLaserStart and other.target == "Player"
                {
                    setSize(image_xscale+.5,image_yscale+.5);
                }
            }
        break;
    }
}