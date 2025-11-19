
//Set Sprite
sprite_index = dice.sprite;

//Ease
image_xscale = lerp(image_xscale,scale,.3);
image_yscale = lerp(image_yscale,scale,.3);

//State
if state == diceStates.idle
{
    scale = 1;
    y = lerp(y,ystart,.2);
}

//Skipped
if skipped
{
    scale = .9;
    image_alpha = lerp(image_alpha,.7,.3);
}

//Sound
if diceId == 3
{
    if rolling
    {
        if !audio_is_playing(snDiceRoll) then audioPlaySfx(snDiceRoll);
    } else audio_stop_sound(snDiceRoll);
}