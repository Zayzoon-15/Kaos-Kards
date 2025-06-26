///@desc Start The Kaos
drawNumberCountdown(display_get_gui_width()/2,display_get_gui_height()/2,"Go!",true);

instance_create_layer(0,0,"Instances",oKaosManager);

instance_destroy();