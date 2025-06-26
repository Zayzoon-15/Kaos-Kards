
//Set Dice Type
if oRollButton.canRoll
{
    switch (diceType) {
    	case 6:
            scale = 1;
            numColor = c_white;
            spriteIdle = sDice6;
            spriteRoll = sDice6Roll;
            range = {
                min : 1,
                max : 6
            };
        break;
        
    	case 8:
            scale = 1;
            numColor = #f6e0ff;
            spriteIdle = sDice8;
            spriteRoll = sDice8Roll;
            range = {
                min : 4,
                max : 8
            };
        break;
        
    	case 12:
            scale = 1.1;
            numColor = #d2ffff;
            spriteIdle = sDice12;
            spriteRoll = sDice12Roll;
            range = {
                min : 6,
                max : 12
            };
        break;
        
    	case 20:
            scale = 1;
            numColor = #b23227;
            spriteIdle = sDice20;
            spriteRoll = sDice20Roll;
            range = {
                min : 9,
                max : 20
            };
        break;
    }
    
    sprite_index = spriteIdle;
}


//Set State
switch (state) {
    
	case DICESTATE.IDLE:
        image_xscale = lerp(image_xscale,scale,.3);
        image_yscale = lerp(image_yscale,scale,.3);
        y = lerp(y,ystart,.2);
    break;
    
    case DICESTATE.COMBINE:

    break;
}

//Sound
if diceId == 3
{
    if rolling
    {
        if !audio_is_playing(snRollDice) {audio_play_sound(snRollDice,0,false);}
    } else audio_stop_sound(snRollDice);
}