var _offset = 40;

if global.playerTempHp > 0
{
    _offset = 550;
}

if room == rPlayerRoom
{
    drawTipBox($"Your Health Bar\nHealth: {global.playerHp}%",90,35,0,bbox_bottom+_offset);
} else{
    if global.playerTempHp <= 0 
    { 
        drawTipBox($"Your Health Bar\nHealth: {global.playerHp}%",90,35,0,bbox_top-_offset);
    } else drawTipBox($"Your Health Bar\nHealth: {global.playerHp}%\nShield: {global.playerTempHp}%",90,45,bbox_top-_offset);
} 