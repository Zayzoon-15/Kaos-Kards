
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
	rectXScale = 2;
	rectYScale = .8;
	
	setSize(1.2,.8);	
}

clickedJuice = function()
{
	rectXScale = 2;
	rectYScale = .8;
	
	setSize(1.2,.8);	
}

action = function()
{
	clickedJuice();
}