
//Ease Alpha
image_alpha = lerp(image_alpha,0,.08);

//Ease Size
image_xscale = lerp(image_xscale,1.3,.1);
image_yscale = lerp(image_yscale,1.3,.1);

//Destroy
if image_alpha <= 0 then instance_destroy();