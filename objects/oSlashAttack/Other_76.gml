///@desc Receive Message

//Animation
broadcastSprite("slashStartAnim",function()
{
    with card
    {
        var _spd = 2;
        var _delay = 3;
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,0,1,"x",targetX,targetX + 4);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,(_spd+_delay),_spd,"x",targetX,targetX - 14);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,(_spd+_delay)*2,_spd,"x",targetX,targetX + 14);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,(_spd+_delay)*3,_spd,"x",targetX,targetX - 7);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,(_spd+_delay)*4,_spd,"x",targetX,targetX + 7);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,(_spd+_delay)*5,_spd,"x",targetX,targetX - 3);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,(_spd+_delay)*6,_spd,"x",targetX,targetX + 3);
    }
},true);

//Sound
broadcastSprite("slashPlaySound",function()
{
    audioPlaySfx(snSlash);
},true);

//Attack
broadcastSprite("slashDamage",action,true);
broadcastSprite("slashCharge",function() {
  currentlyDamaging = true;  
},true);