//Order In Deck
if room == rDeckBuilder2
{
    var _leftEdge = (maxRow - 1)*(gap.x/2);
    targetX = startPos.x - _leftEdge + (rowId * gap.x);
    ystart = startPos.y + (row * gap.y);
}