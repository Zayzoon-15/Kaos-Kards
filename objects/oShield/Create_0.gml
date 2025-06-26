
setSize(.8,.8);
image_alpha = 0;
curvePos = 0;
curveSpd = 0.03;

value = round(value);
value *= 2;

if target == "Enemy"
{
    global.playerTempHp += value;
} else global.enemyTempHp += value;

numberHitEffect(x,y,value,true);

