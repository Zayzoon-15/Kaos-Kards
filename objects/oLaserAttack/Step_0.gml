//Animate Card
with card 
{
    //Loop Animation
    if other.loopShake
    {
        animCurve = acLaserCard;
        y += animGetValue(animCurve, curvePos, 0)*7;
        
        curvePos += .1;
        if curvePos > 1 then curvePos = 0;
    }
    
}