//Set Scissor Mask
if instance_exists(oSettingsSubMenu)
{
    //Set Scissor
    var _scissor = gpu_get_scissor();
    gpu_set_scissor(oSettingsSubMenu.scissorStuct);
    
    //Draw Button
    drawBtn();
    
    //Draw Disabled
    if disabled
    {
        //Draw Box
        var _alpha = .8;
        drawRectOutlined(rectX1,rectY1,rectX2,rectY2,UIBOX_RAD,2,c_black,c_black,_alpha*image_alpha,_alpha*image_alpha);
        
        //Draw Text
    	textSetup(fnMain,fa_center,fa_middle);
    	draw_text_transformed(x,y,reason,textScaleX,textScaleY,0);
    }
    
    //Reset Scissor
    gpu_set_scissor(_scissor);
}