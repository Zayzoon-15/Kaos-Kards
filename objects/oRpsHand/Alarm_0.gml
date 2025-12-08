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