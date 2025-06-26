//Follow
if follow and instance_exists(parent)
{
    x = parent.x+xOffset;
    y = parent.y+yOffset;
}


if instance_exists(parent)
{
var _part = oPartSystemFire;

var _dir = irandom_range(50,130);
var _spd = random_range(0.05,0.1);
var _size = random_range(1,1.5);

//Sync
part_type_direction(_part.partTypeFire,_dir,_dir,0,0);
part_type_speed(_part.partTypeFire,_spd,_spd,0,0);
part_type_size(_part.partTypeFire,_size,_size,-0.01,0);


part_type_direction(_part.partTypeFireOutline,_dir,_dir,0,0);
part_type_speed(_part.partTypeFireOutline,_spd,_spd,0,0);
part_type_size(_part.partTypeFireOutline,_size+0.2,_size+0.2,-0.01,0);

//Spawn
part_emitter_region(_part.partSystem,emitterFire,x,x,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(_part.partSystem,emitterFire,_part.partTypeFire,1);

part_emitter_region(_part.partSystemBelow,emitterFireOutline,x,x,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(_part.partSystemBelow,emitterFireOutline,_part.partTypeFireOutline,1);

/*
part_emitter_region(_part.partSystemBelow,emitterFireOutline,x,x,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(_part.partSystemBelow,emitterFireOutline,_part.partTypeSmoke,1);
/*/
}