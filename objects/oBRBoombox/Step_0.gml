
if curSong != songs[0]
{
    
    //Update Curve
    var _delta = (delta_time / 1000000)/(1/60);
    curvePos += 1 / (60*_delta * time_bpm_to_seconds(curSong[1]));

    if curvePos >= 1
    {
        angDir *= -1;
        curvePos = 0;
    }
    
    //Set Value
    y = ystart - animGetValue(acBRBoombox,curvePos,"y")*10;
    image_angle = animGetValue(acBRBoombox,curvePos,"angle")*5*angDir;
} else {
	curvePos = 0;
}