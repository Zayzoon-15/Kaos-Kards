//Inherit
event_inherited();

//Destroy
if !array_contains([rPrepare,rKaos,rEnemy],room)
{
	instance_destroy();
}

//Move Towards Health Bar
if instance_exists(healthInst)
{
    
    //Move To Health Bar
    x = lerp(x,healthInst.x,.02);
    
    //Depth
    depth = healthInst.depth + 1;
    
}