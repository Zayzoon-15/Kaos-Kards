///@desc Give Starting Cards

givePlayerCards();

startingCards ++;

if startingCards < maxHandSize
{
    alarm[0] = 10;
} else finishedDrawing = true;