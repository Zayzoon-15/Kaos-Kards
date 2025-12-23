notHeld = function(){};

//Set Type
switch buttonType
{
	case "Left": 
		image_index = 0; 
		type = "Hold";
		action = function()
		{
			with oBrawlChar
			{
				if playerId == 0
				{
					keyLeft = 1;
				}
			}
		}
		notHeld = function()
		{
			with oBrawlChar
			{
				if playerId == 0
				{
					keyLeft = 0;
				}
			}
		}
	break;
	
	case "Right": 
		image_index = 1; 
		type = "Hold";
		action = function()
		{
			with oBrawlChar
			{
				if playerId == 0
				{
					keyRight = 1;
				}
			}
		}
		notHeld = function()
		{
			with oBrawlChar
			{
				if playerId == 0
				{
					keyRight = 0;
				}
			}
		}
	break;
	
	case "Jump": 
		image_index = 2; 
		type = "Press";
		action = function()
		{
			with oBrawlChar
			{
				if playerId == 0
				{
					actJump();
				}
			}
		}
	break;
	
	case "Punch": 
		image_index = 3; 
		type = "Press";
		action = function()
		{
			with oBrawlChar
			{
				if playerId == 0
				{
					actPunch();
				}
			}
		}
	break;
}

//Touch Id
touchId = -1;
held = false;

//Image
xscale = 1;
yscale = 1;
targetScale = 1;
fade = false;