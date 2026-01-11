//Inherit
event_inherited();

//Set Amounts
currentAmount = 50;

//Drag
dragging = false;
playSound = false;

//Slider Box
sliderBoxX1 = 0;
sliderBoxX2 = 0;
sliderBoxY1 = 0;
sliderBoxY2 = 0;
sliderBoxWidth = 0;

//Change Variable
if variable_global_exists(changeVar)
{
    currentAmount = variable_global_get(changeVar);
}

//Functions
clickedJuice = function()
{
	
}

action = function()
{
	dragging = true;	
    
    //Set Mobile Drag
    if instance_exists(oSettingsSubMenu)
    { 
        oSettingsSubMenu.mobileCanDrag = false;
    }
}

drawBtn = function()
{
    //Draw Box
    drawBox();
    
    //Slider Value
    var _sliderText = $"{ceil(currentAmount)}{textIcon}";
    
    //Draw Slider Value
    textSetup(fnMain,fa_center,fa_middle,c_white,image_alpha);
    draw_text_transformed(sliderBoxX1+sliderBoxWidth/2,y,_sliderText,1,1,0);
    drawReset();
    
    //Draw Slider
    draw_set_alpha(image_alpha);
    var _fillOffset = 10;
    var _value = (currentAmount / slideMax) * 100;
    
    draw_healthbar(sliderBoxX1+_fillOffset,sliderBoxY1+_fillOffset,sliderBoxX2-_fillOffset,sliderBoxY2-_fillOffset,_value,c_black,c_white,c_white,0,false,false);
    drawRectOutlined(sliderBoxX1,sliderBoxY1,sliderBoxX2,sliderBoxY2,UIBOX_RAD,2,c_black,c_white,0,image_alpha);
    
    //Draw Slider Value
    textSetup(fnMain,fa_center,fa_middle,c_black,image_alpha);
    
    //Create Surface
    var _surface = surface_create((currentAmount / slideMax) * sliderBoxWidth+1.5,40);
    surface_set_target(_surface);
    draw_clear_alpha(c_black, 0);
    
    //Draw Text 
    draw_text_transformed(sliderBoxWidth/2,20,_sliderText,1,1,0);
    
    //Reset Stuff
    surface_reset_target();
    gpu_set_scissor(oSettingsSubMenu.scissorStuct);
    draw_surface(_surface,sliderBoxX1,sliderBoxY1);
    surface_free(_surface);
    drawReset();
}