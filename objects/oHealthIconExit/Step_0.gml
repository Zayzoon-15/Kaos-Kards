//Inherit
event_inherited();

if instance_exists(healthInst)
{
    
    //Move To Health Bar
    x = lerp(x,healthInst.x,.02);
    
    //Depth
    depth = healthInst.depth + 1;
    
}