
partSystem = part_system_create_layer("Particels",false);
partSystemBelow = part_system_create_layer("ParticelsBelow",false);

var _fireLife = 9;

#region Fire

partTypeFire = part_type_create();
part_type_sprite(partTypeFire,sPartFire,false,false,false);

part_type_life(partTypeFire,_fireLife,_fireLife);
part_type_alpha3(partTypeFire,1,1,0.1);
part_type_scale(partTypeFire,1,1);

part_type_size(partTypeFire,1,1,-0.01,0);

part_type_color1(partTypeFire,make_color_rgb(224,160,15));
part_type_blend(partTypeFire,true);

part_type_gravity(partTypeFire,0.005,90);

#endregion


#region Fire Outline

partTypeFireOutline = part_type_create();
part_type_sprite(partTypeFireOutline,sPartFire,false,false,false);

part_type_life(partTypeFireOutline,_fireLife+3,_fireLife+3);
part_type_alpha3(partTypeFireOutline,1,1,0.1);
part_type_scale(partTypeFireOutline,1,1);

part_type_color1(partTypeFireOutline,make_color_rgb(159,56,4));
//part_type_blend(partTypeFireOutline,true);

part_type_gravity(partTypeFireOutline,0.005,90);

#endregion


#region Smoke

partTypeSmoke = part_type_create();
part_type_sprite(partTypeSmoke,sPartFire,false,false,false);

part_type_life(partTypeSmoke,20,20);
part_type_alpha3(partTypeSmoke,0.05,0.05,0.5);
part_type_scale(partTypeSmoke,1,1);

//part_type_size(partTypeSmoke,1,1,1,1);

part_type_color2(partTypeSmoke,$1f1a1e,$363234);

part_type_direction(partTypeSmoke,48,132,0,0);
part_type_speed(partTypeSmoke,0.05,0.11,-0.001,0);

part_type_gravity(partTypeSmoke,0.001,90);

#endregion
