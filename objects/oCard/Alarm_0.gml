///@desc Get Values

//Get Range
if info.range != undefined
{
    currentValue = irandom_range(info.range[0],info.range[1]);
}

//Juice
cardJuice();

//Sound
audioPlaySfx(snCardValue,.95,1.05);
