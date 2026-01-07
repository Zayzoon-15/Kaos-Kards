//Box
width = 30;
height = 40;

//Rectangle Vars
rectX1 = 0;
rectX2 = 0;
rectY1 = 0;
rectY2 = 0;

//Rectangle Image
rectXScale = 0;
rectYScale = 0;
rectAlpha = 0;

//Hover
hover = false;
canHover = true;

//Disabled
disabled = false;
reason = "";


//Functions
hoverJuice = function()
{
	//Set Scale
	rectXScale = 1.2;
	rectYScale = .9;
	
	//Set Text Scale
	setSize(1.2,.9);
	
	//Sound
	audioPlaySfx(snSettingsHover);
}

clickedJuice = function()
{
	//Set Scale
	rectXScale = 1.2;
	rectYScale = .9;
	
	//Set Text Scale
	setSize(1.2,.9);
	
	//Sound
	audioPlaySfx(snSettingsSelect,.9,1.1);
}

action = function()
{
	clickedJuice();
}