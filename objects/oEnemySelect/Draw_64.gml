
if canPress and !locked and !global.showCards
{
    drawTipBox(text,boxSize.width,boxSize.height,40);
}

if locked and !global.showCards
{
    drawTipBox("Must beat\nprevious enemy",80,30,40);
}