//Inherit
event_inherited();

//Visual
flipSprite = true;
posBasedOnCard = true;
newYPos = [card.bbox_top,card.bbox_bottom];

//Stats
hitOthers = true;
currentlyDamaging = true;
isCombo = true;

//Damage Times
damageTotalTimes = 4;
damageTimes = 0;
damageFrames = 0;
value = clamp(value / damageTotalTimes+1,5,100);

//Shake
with oAttackCard
{
	shake = 15;
	cardSetShake(0,.06);
}
card.shake = 40;

//Move
moveToDir(5,false);

//Action
action = function()
{
    //Damage Times
    if damageTimes >= damageTotalTimes
    {
        instance_destroy();
        timeSourceCreate(1,eventComboAttackDone);
    }
    
    //Reduce Damage Frames
    damageFrames--;
    if damageFrames > 0 then exit;
    
    //Reduce Speed
    speed -= 1.5;
    speed = max(speed,1);
    
    //Damage
    damageTarget();
    hurtEffect(x,y,25);
    
    //Set Frames
    damageFrames = 20;
    damageTimes ++;
}