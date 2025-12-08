//Check
with oRpsHand
{
	//Check If Same Hand
	if handId == 0
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
}

with oRpsHand
{
	
	
	
}