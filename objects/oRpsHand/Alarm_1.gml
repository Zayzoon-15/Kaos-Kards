///@desc Check Who Won

//Get Other Hand
var _otherHand = noone;
with oRpsHand
{
	if handId != other.handId then _otherHand = self.id;
}

///Check Winner
//Rock = 0, Paper = 1, Scissor = 2

//Set Draw
if action == _otherHand.action then outcome = "Draw";

//Rock Vs Paper
if action == 0 and _otherHand.action == 1 then outcome = "Lost";
if action == 1 and _otherHand.action == 0 then outcome = "Won";

//Rock Vs Scissor
if action == 2 and _otherHand.action == 0 then outcome = "Lost";
if action == 0 and _otherHand.action == 2 then outcome = "Won";

//Paper Vs Scissor
if action == 1 and _otherHand.action == 2 then outcome = "Lost";
if action == 2 and _otherHand.action == 1 then outcome = "Won";


//Set Outcome
if outcome == "Won"
{
	winner = true;
} else if outcome == "Lost"
{
	_otherHand.winner = true;
}

//Redo If Draw
with oRpsHand  {
    alarm[2] = other.outcome == "Draw" ? 40 : 100;
}

if outcome == "Draw"
{
    exit;
}


//Winner Outcome
if winner
{
    //End Kaos
    timeSourceCreate(2.5,kaosCardDone);
    
    //Depth
    depth = _otherHand.depth - 5;
    
    //Tween
    TweenEasyScale(image_xscale,1,1.4*sign(image_xscale),1,0,40,EaseOutElastic);
    
    //Hurt
    timeSourceCreate(8.5,function() {
        
        //Stars
        var _x = handId == 0 ? bbox_right - 10 : bbox_left + 10;
        effectStar(_x,y,15,true,50,150,40);
        
        //Hurt
        var _amount = irandom_range(10,15);
        print(_amount);
            
        if handId == 1
        {
            hurtEnemy(_amount);
        }
        
        if handId == 0
        {
            hurtPlayer(_amount);
        }
        
    },[],time_source_units_frames);
}