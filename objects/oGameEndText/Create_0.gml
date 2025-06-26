

switch (gamestate) {
	case GAMESTATE.PLAYERWIN:
        //Set Sprite
        sprite_index = sWin;
        
        //Audio
        audio_play_sound(snWin,0,false);
        
        //Effects
        starEffect(x,y,20,-100,100,-50,50);
    break;
    
    case GAMESTATE.PLAYERLOSS:
        //Set Sprite
        sprite_index = sLose;
        
        //Audio
        audio_play_sound(snLose,0,false);
        
        //Animate
        TweenEasyFade(0,1,0,30,EaseOutCubic);
    break;
}

//Spawn Buttons
alarm[0] = 60;
