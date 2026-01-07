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
    	textSetup(fnMain,fa_center,fa_middle);
    	draw_text_transformed(x,y,reason,textScaleX,textScaleY,0);
    }
    
    //Reset Scissor
    gpu_set_scissor(_scissor);
}