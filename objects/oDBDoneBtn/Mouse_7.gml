//Start Transition
if canPress and pressed
{
    if global.currentTourney == undefined
    {
        transStart(rTournies,oTransSticker);
    } else transStart(rBreakRoom);
}