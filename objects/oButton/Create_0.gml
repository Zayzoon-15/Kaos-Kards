//Inherit Delta Object
event_inherited();

#region --- Position ---

//Position
targetX = x; //The position the box will follow at all times
targetY = y;
easeBoxPos = true; //If the box should ease to its position

//Offsets
boxOffsetX = 0;
boxOffsetY = 0;

#endregion

#region --- Image ---

//Shake
shake = 0;

//Shadow 
drawShadow = true;
shadowX = 0;
shadowY = 0;

//Scale
targetXScale = image_xscale;
targetYScale = image_yscale;
xscale = 1;
yscale = 1;

//Offset Scale
boxXScaleOffset = 0;
boxYScaleOffset = 0;

//Text
textTargetScale = 2;
textXScale = textTargetScale;
textYScale = textTargetScale;

//Alpha
alpha = 1;

#endregion

//Clicking
pressed = false;
hover = false;
mobilePress = false;
buttonUsed = false; //If the button has already been pressed

//Toggles
canPress = true;
canHover = true;
ignore = false;

//Sound
soundHover = [snBtnHover1,snBtnHover2];
soundPressed = snBtnPress;
soundDeny = [snDeny1,snDeny2];

//Apply Options
timeSourceCreate(2, function(){
    
    //Stick To Screen Instantly
    if stickToScreen and ((isUi and global.stickUiToScreen) or (global.stickItemsToScreen and !isUi)) {
        x = getPosToWindow(stickToRight, targetX);
    }
    
}, [], time_source_units_frames);

#region --- Custom Functions ---

///On Something Events

//Fires when button is barley hovered 
onHover = function() {
	
}

///Checks Something

//Returns if the button should be pressed
condition = function() {
    return true;
}


///Actions

//What the button does when pressed
action = function() {
    
}

#endregion