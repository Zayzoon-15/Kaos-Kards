//Inherit the parent event
event_inherited();

//Visual
flipSprite = true;
card.rotAngle = false;

//Stats
currentlyDamaging = false;

//Functions
action = function()
{
    //Set Right Pos
    var _y;
    if targetEnemy then _y = bbox_top+50; else _y = bbox_bottom-50;
    
    //Functions
    effectNumber(x,_y,-value);
    effectStar(x,_y,5,false,20,25);
    damageTarget();
    
    //Hurt Card Juice
    with (getCard()) {
        effectStar(x,y,5,false);
    	cardFlash(.9,c_white,1);
        setSize(1.1,1.1);
        var _spd = 4;
        var _delayStart = 7;
        var _delay = 4;
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,_delayStart,_spd,"x",targetX,targetX - 14);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,(_delayStart+_spd),_spd,"x",targetX,targetX + 14);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,(_delayStart+_delay+_spd)*2,_spd,"x",targetX,targetX - 7);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,(_delayStart+_delay+_spd)*3,_spd,"x",targetX,targetX + 7);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,(_delayStart+_delay+_spd)*4,_spd,"x",targetX,targetX - 3);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,(_delayStart+_delay+_spd)*5,_spd,"x",targetX,targetX + 3);
    }
    
}