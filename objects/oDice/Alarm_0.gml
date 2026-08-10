///@desc Roll Done

//Reset Sprite
image_speed = 0;
image_index = 0;

//Animation
diceJuice();

//Dice Number
diceNum = irandom_range(dice.range.min,dice.range.max);

//Cheer If Perfect
if diceNum == dice.range.max
{
    audioPlaySfx(snCheer,.9,1.1);
}

//Final Dice
if diceId == 3
{
    with oDice {rolling = false;}
    alarm[1] = 30;
}