
//Set Position
if state != DICE_STATES.COMBINE {
    x = global.stickItemsToScreen ? getPosToWindow(false) : xstart;
    y = lerp_dt(y, ystart, .2);
}

//Stop Roll Sound
if diceId == 3 and stopSound {
    audio_stop_sound(snDiceRoll);
}

//Swap Dice Back To Normal
if !isTargeted and diceType != baseDiceType {
    changeDiceType(baseDiceType);
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

//Change Lock On Image
if isTargeted and state != DICE_STATES.COMBINE and state != DICE_STATES.SKIPPED {
    //Change Frame
    lockOnFrame += (sprite_get_speed(sDiceLockOn) * delta()) / game_get_speed(gamespeed_fps);
    
    //Fade In
    lockOnAlpha = lerp_dt(lockOnAlpha, 1, .3);
    
} else lockOnAlpha = lerp_dt(lockOnAlpha, 0, .3); //Fade Away

#endregion