///@desc Finish Roll

//Animation
sprite_index = spriteIdle;
diceJuice();

//Dice Number
randomize();
diceNum = irandom_range(range.min,range.max);

//Clear For Now
if diceId == 3
{
    rolling = false;
    alarm[1] = 30;
}