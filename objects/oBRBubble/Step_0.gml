//Move To Speaker
x = oBRSpeaker.x + 11;
y = oBRSpeaker.y;

//Make Characters Show
textShow = string_copy(text,0,textChars);
textChars += .3;

//Shrink Text
while string_height_ext(textShow,20,maxWidth/textScale) * textScale >= maxHieght {
	textScale -= .01;
}

//Finish Talking
if string_length(textShow) >= string_length(text)
{
    //Go Away
    finishFrames ++;
    if finishFrames >= 60 and !goAway
    {
        //Set Go Away
        goAway = true;
        
        //Animation
        TweenEasyFade(1,0,0,20,EaseLinear);
        
        //Destory
        timeSourceCreate(20,instance_destroy,[self.id],time_source_units_frames);
    }
}