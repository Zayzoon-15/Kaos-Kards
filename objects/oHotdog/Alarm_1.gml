///@desc Timer

if timer > 0
{
    timer -= 60;
    alarm[1] = 60;
} else { //End Game
    
    gameStarted = false;
    
    //Destroy Clicks
    audioPlaySfx([snStars1,snStars2]);
    with oHotdogClick
    {
        effectStar(x,y,5,false);
        instance_destroy();
    }
    
    //Check Winner
    with oHotdogGuy {
        sprite_index = sHotdogGuyIdle;
        alarm[2] = 120;
    }
}

