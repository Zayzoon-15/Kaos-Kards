//Position
boxX = x;
boxY = y;
targetX = x;
targetY = y;

//Image
xscale = image_xscale;
yscale = image_yscale;
scaleTime = .3;
shake = 0;
boxAlpha = .5;

//Clicking
pressed = false;

//Text
textTargetSize = 3;
textSize = textTargetSize;


//Action
action = function()
{
    //Destroy Buttons
    instance_destroy(oParSettingsBtn);
    
    //Reset Values
    oSettingsSubMenu.scroll = 0;
    global.settingsBtnId = 0;
    
    //Set Button
    if targetMenu != "Back" then oSettings.lastButton = btnId;
    
    //Set Text
    oSettingsSubMenu.menuText = targetMenu;
    
    //Create Menu
    switch (targetMenu) {
        
        //Menus
        case "Audio": SettingsMenus.Audio(); break;
        case "Video": SettingsMenus.Video(); break;
        case "Game": SettingsMenus.Game(); break;
        case "Input": SettingsMenus.Input(); break;
           
        //Back
    	case "Back": oSettings.destroySettings(); break;
    }
}

//Check Selected
alarm[0] = 1;