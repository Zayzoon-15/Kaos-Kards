///@desc Get Cards Range Value

//Get Range
if info.range != undefined {
    currentValue = irandom_range(info.range[0], info.range[1]);
}

//Juice
cardJuice();
audioPlaySfx(snCardValue, .95, 1.05);