
//Ease Alpha
image_alpha = lerp_dt(image_alpha,0,.08);

//Ease Size
image_xscale = lerp_dt(image_xscale,1.3,.1);
image_yscale = lerp_dt(image_yscale,1.3,.1);

//Destroy
if image_alpha <= 0 then instance_destroy();