///@desc Roll Done

//Reset Sprite
image_speed = 0;
image_index = 0;

//Animation
diceJuice();

//Dice Number
randomize();
diceNum = irandom_range(dice.range.min,dice.range.max);

//Final Dice
if diceId == 3
{
    with oDice {rolling = false;}
    alarm[1] = 30;
}