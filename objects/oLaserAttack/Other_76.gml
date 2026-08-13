
broadcastSprite("laserStartShake",function() {
    
    //Animation Setup
    var _animSpd = 4;
    
    //Animate Card Moving
    with card
    {
        //Position Setup
        var _baseX = targetX;
        var _baseY = targetY;
        
        //Move Left And Right
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,0,_animSpd,"x",x,_baseX+2);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,_animSpd,_animSpd,"x",x,_baseX-2);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,_animSpd*2,_animSpd,"x",x,_baseX+5);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,_animSpd*3,_animSpd,"x",x,_baseX-5);
        
        //Offset When First Fire
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,_animSpd*4,_animSpd,"x",x,_baseX+5);
        TweenFire(self,EaseLinear,TWEEN_MODE_ONCE,false,_animSpd*4,_animSpd,"y",y,_baseY+7);
    }
    
    //Loop Shake
    timeSourceCreate(_animSpd*5,function()
    {
        card.x = card.targetX;
        card.y = card.targetY;
        loopShake = true;
    },[],time_source_units_frames);
    
});

broadcastSprite("laserStartSound",function() {
    
    //Get Laser Insts
    var _insts = 0;
    with (oLaserAttack) {
    	if self.id != other.id
        {
            _insts ++;
        }
    }
    
    //Set Gain
    var _gain = 1 - (_insts*.05);
    
    //Play Sound
    laserSound = audioPlaySfx(snLaser,1,1,1,1,.1);
    
    //Clash
    beamSprite = sLaserClashStart;
	
});

broadcastSprite("laserStartAttack",function(){
	currentlyDamaging = true;
    
    flashBg(.3);
});