///@desc Destroy
if canPress
{
    alarm[1] = 60;
    TweenEasyFade(1,0,0,20,EaseLinear);
    TweenEasyScale(1,1,0,0,0,25,EaseInBack);
    
    with oRewardCard
    {
        canPress = false;
        TweenEasyFade(1,0,0,20,EaseLinear);
        TweenEasyScale(1,1,0,0,0,25,EaseInBack);
    }
    
    global.giveCards = false;
    global.showCards = false;
    canPress = false;
}