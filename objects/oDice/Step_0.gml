
//Set Sprite
sprite_index = dice.sprite;

//Ease
image_xscale = lerp(image_xscale,scale,.3);
image_yscale = lerp(image_yscale,scale,.3);

//State
switch (state) {
	case DICESTATE.IDLE:
        scale = 1;
        y = lerp(y,ystart,.2);
    break;
}

//Skipped
if skipped
{
    scale = .9;
    image_alpha = lerp(image_alpha,.7,.3);
}
