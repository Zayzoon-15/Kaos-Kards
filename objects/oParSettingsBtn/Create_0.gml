//Box
width = oSettingsSubMenu.sprite_width-30;
height = 40;

//Rectangle Vars
rectX1 = 0;
rectX2 = 0;
rectY1 = 0;
rectY2 = 0;

//Rectangle Image
rectXScale = 1;
rectYScale = 1;
rectAlpha = 0;

//Text
textScaleX = 1;
textScaleY = 1;

//Hover
hover = false;
canHover = true;

#region Functions


hoverJuice = function()
{
	//Set Scale
	rectXScale = 1.02;
	rectYScale = .9;
	
	//Set Text Scale
    textXScale = 1.2;
    textYScale = .9;
	
	//Sound
	audioPlaySfx(snSettingsHover);
}

clickedJuice = function()
{
	//Set Scale
	rectXScale = 1.03;
	rectYScale = .9;
	
	//Set Text Scale
    textXScale = 1.3;
    textYScale = .9;
	
	//Sound
	audioPlaySfx(snSettingsSelect,.9,1.1);
}

action = function()
{
	clickedJuice();
    
    btnAction();
}

drawBox = function()
{
    //Draw Bg
    var _bgColor = merge_color(c_black,c_gray,rectAlpha);
    drawRectOutlined(rectX1,rectY1,rectX2,rectY2,UIBOX_RAD,2,_bgColor,c_white,.5*image_alpha,image_alpha);
    
    //Draw Name
    textSetup(fnMain,fa_left,fa_middle,c_white,image_alpha);
    draw_text_transformed(rectX2 + 20,y,text,textScaleX,textScaleY,0);
    
    //Reset Draw
    drawReset();
}

/// @desc Draws The Button And Other Stuff
drawBtn = function()
{
    //Draws Box And Text
    drawBox();
    
    //Draw Other Stuff Here
    
}

#endregion