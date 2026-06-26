if !animate then exit;

//Get Anim Curve
borderEase = animGetValue(acMiniBoss,animPos,"border");
image_angle = animGetValue(acMiniBoss,animPos+.2,"angle") * 50;

//Update Anim Curves
animPos += animSpd;