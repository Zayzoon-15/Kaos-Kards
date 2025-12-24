broadcastSprite("laserSetShake",function(){
    laserSound = audioPlaySfx(snLaser);
	card.cardSetShake(6);
	
});

broadcastSprite("laserStartAttack",function(){
	currentlyDamaging = true;
});