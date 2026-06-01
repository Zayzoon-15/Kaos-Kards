//Inherit
event_inherited();

//Button
canHover = true;
isMenuButton = true;

//Info
drawInfo = false;
text = "Okay";

//Text
textXScale = 0;
TweenEasyFade(0,1,0,10,EaseOutCubic);


//Action
action = function()
{
    //Fade Menu
    with oRewardCard {TweenEasyFade(1,0,0,15,EaseLinear);}
    with oReward {
        TweenEasyFade(1,0,0,15,EaseLinear);
        for (var i = 0; i < array_length(extra); i++) {
        	with extra[i]
            {
                TweenEasyFade(1,0,0,15,EaseLinear);
            }
        }
    }
    TweenEasyFade(1,0,0,15,EaseLinear);
    
    //Destroy Menu
    timeSourceCreate(15,instance_destroy,[oReward],time_source_units_frames);
}