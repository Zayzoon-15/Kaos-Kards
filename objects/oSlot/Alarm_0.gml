///@Desc Get notified when a card should get a value

//Slot Empty
if !filled and !disabled {
    instance_create_layer(x,bbox_top,"Effects",oEffectSkipped);
    scaleX += .3;
    scaleY += .3;
    used = true;
}

//Start Dice Combination
if slotId == 3 {
    with oDice {
        combineValues();
    }
}