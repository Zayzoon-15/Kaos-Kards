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
            instance_create_layer(0,0,"Ui",oReward);
        break;
    
    	case "Enemy Intro":
            instance_create_layer(0,0,"Ui",oBattleIntro);
        break;
    
    	case "MiniBoss":
            instance_create_layer(0,0,"Ui",oMiniBossAlert);
        break;
    }
}
