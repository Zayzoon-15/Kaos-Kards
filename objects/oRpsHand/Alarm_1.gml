///@desc Check Who Won

//Get Other Hand
var _otherHand = noone;
with oRpsHand
{
	if handId != other.handId then _otherHand = self.id;
}

//Check
with _otherHand
{
	//Same Hand
	if action == other.action then outcome = "Draw";
	
	//Rock Vs Paper
	if action == 1 and other.action == 0 then outcome = "Won";
	if action == 0 and other.action == 1 then outcome = "Lost";
	
	//Rock Vs Scissor
	if action == 0 and other.action == 2 then outcome = "Won";
	if action == 2 and other.action == 0 then outcome = "Lost";
	
	//Scissor Vs Paper
	if action == 2 and other.action == 1 then outcome = "Won";
	if action == 1 and other.action == 2 then outcome = "Lost";
}

//Set Outcome
if outcome == "Won"
{
	winner = true;
} else if outcome == "Lost"
{
	_otherHand.winner = true;
}

//Redo If Draw
if outcome == "Draw"
{
    timeSourceCreate(.3,function()
    {
        with oRpsHand
        {
            //Animate
            alarm[0] = 40;
            handDown = 0;
            
            //Set Values
            played = false;
            outcome = "";
            currentAnim = 3;
            action = irandom_range(0,2);
        }
    });
    
    exit;
}

//Effect
with oRpsHand
{
    if outcome == "Won" or outcome == "Lost"
    {
        alarm[2] = 100;
    }
    
    if winner
    {
        //Depth
        depth = _otherHand.depth - 5;
        
        //Tween
        TweenEasyScale(image_xscale,1,1.4*sign(image_xscale),1,0,40,EaseOutElastic);
        
        //Hurt
        timeSourceCreate(10,function() {
            
            //Stars
            var _x = handId == 0 ? bbox_right - 10 : bbox_left + 10;
            starEffect(_x,y,15,true,50,150,40);
            
            //Hurt
            with oRpsHand
            {
                randomise();
                var _amount = irandom_range(10,15);
                
                if handId == 0 and winner
                {
                    hurtEnemy(_amount);
                }
                
                if handId == 1 and winner
                {
                    hurtPlayer(_amount);
                }
            }
            
        },[],time_source_units_frames);
    }
}