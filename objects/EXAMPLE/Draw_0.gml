if instance_exists(oSettingsSubMenu)
{
    var _scissor = gpu_get_scissor();
    gpu_set_scissor(oSettingsSubMenu.scissorStuct);
    
    draw_self();
    
    gpu_set_scissor(_scissor);
}