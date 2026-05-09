broadcastSprite("laserSetShake",function() {
    
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
    laserSound = audioPlaySfx(snLaser);
    
    
    //Juice
	card.cardSetShake(6);
	
});

broadcastSprite("laserStartAttack",function(){
	currentlyDamaging = true;
});