///@desc Get Values

//Randomise;
randomise();

//Get Range
if info.range != undefined
{
    currentValue = irandom_range(info.range.min,info.range.max);
}

//Juice
cardJuice();

//Sound
audioPlaySfx(snCardCombine,.95,1.05);