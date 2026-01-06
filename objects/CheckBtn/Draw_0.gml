if instance_exists(SubMenu)
{
    var _scissor = gpu_get_scissor();
    gpu_set_scissor(SubMenu.scissorStuct);
    
    draw_self();
    
    gpu_set_scissor(_scissor);
}