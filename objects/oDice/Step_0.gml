
//Set Sprite
sprite_index = dice.sprite;

switch (state) {
	case DICESTATE.IDLE:
        image_xscale = lerp(image_xscale,1,.3);
        image_yscale = lerp(image_yscale,1,.3);
        y = lerp(y,ystart,.2);
    break;
}