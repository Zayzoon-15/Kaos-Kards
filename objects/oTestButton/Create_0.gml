//Inherit
event_inherited();

//Text
sizeToText = true;
text = $" {button} ";

//Action
action = function()
{
    switch (button) {
    	case "Reward":
            instance_create_depth(0,0,-1,oReward);
        break;
    
    	case "Enemy Intro":
            instance_create_depth(0,0,-1,oEnemyIntro);
        break;
    }

}
