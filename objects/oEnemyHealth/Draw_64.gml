var _offset = 40;


if global.enemyTempHp <= 0 
{ 
    drawTipBox($"Enemies Health Bar\nHealth: {global.enemyHp}%",90,35,0,bbox_bottom+_offset);
} else drawTipBox($"Enemies Health Bar\nHealth: {global.enemyHp}%\nShield: {global.enemyTempHp}%",90,45,0,bbox_bottom+_offset);
