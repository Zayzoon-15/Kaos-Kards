
//Set Sprite
sprite_index = dice.sprite;

//Ease
image_xscale = lerp_dt(image_xscale,scale,.3);
image_yscale = lerp_dt(image_yscale,scale,.3);

//State
if state == diceStates.idle
{
	//Set Scale
	scale = 1;
	
	//Set Position
	x = getPosToWindow(false);
    y = lerp_dt(y,ystart,.2);
}

//Skipped
if skipped
{
    scale = .9;
    image_alpha = lerp_dt(image_alpha,.7,.3);
}

//Sound
if diceId == 3
{
    if rolling
    {
        if !audio_is_playing(snDiceRoll) then audioPlaySfx(snDiceRoll);
    } else audio_stop_sound(snDiceRoll);
}