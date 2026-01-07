//Inherit
event_inherited();

//Can't Hover
canHover = false;

//Text
textTargetScale = 2;

#region Functions


hoverJuice = function()
{

}

clickedJuice = function()
{

}

action = function()
{
    
}

drawBox = function()
{
    //Set Alpha
    var _alpha = 1;
    
    //Draw Line
    draw_line_width(rectX2,y,x - (string_width(text)+10)*textTargetScale/2,y,5);
    draw_line_width(rectX1,y,x + (string_width(text)+10)*textTargetScale/2,y,5);
    
    //Draw Name
    textSetup(fnMain,fa_center,fa_middle,c_white,_alpha);
    draw_text_transformed(x,y,text,textScaleX,textScaleY,0);
    
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