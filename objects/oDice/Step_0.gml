
//Set Position
if state != DICE_STATES.COMBINE {
    x = global.stickItemsToScreen ? getPosToWindow(false) : xstart;
    y = lerp_dt(y, ystart, .2);
}

#region --- Image ---

//Set Sprite
sprite_index = diceType.sprite;

//Ease Scale
image_xscale = lerp_dt(image_xscale, targetScale, .3);
image_yscale = lerp_dt(image_yscale, targetScale, .3);

//Change Visuals If Skipped
if state == DICE_STATES.SKIPPED {
    targetScale = .9;
    image_alpha = lerp_dt(image_alpha,.7,.3);
}

#endregion