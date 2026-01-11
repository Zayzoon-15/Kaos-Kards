//Inherit the parent event
event_inherited();

//Input Key
key = "NAN";
selectingKey = false;

//Functions
btnAction = function()
{
    selectingKey = true;
}

/// @desc Draws The Button And Other Stuff
drawBtn = function()
{
    //Draws Box And Text
    drawBox();
    
    //Draw Input Key
    textSetup(fnMain,fa_right,fa_middle);
    var _text = is_real(key) ? keyToString(key) : key;
    
    draw_text_transformed(rectX1 - 20,y,_text,textScaleX,textScaleY,0);
    
}

clickedJuice = function()
{
	//Set Box Scale
	rectXScale = 1.03;
	rectYScale = .9;
	
	//Set Text Scale
    textXScale = 1.3;
    textYScale = .9;
	
	//Sound
	audioPlaySfx(snSettingsSelect,.9,1.1);
    
    print(key)
}
