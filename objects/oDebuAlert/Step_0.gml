//Set Alert Boxes Position
var _dist = 60;
var _top = room_height - array_length(variable_global_get("_alertBox")) * _dist;
x = lerp_dt(x, 0, .2);
y = lerp_dt(y, _top + _dist * alertId, .2);

//Ease In And Out
if lifespan > 0 {
    image_alpha = lerp_dt(image_alpha, 1, .1);
    lifespan --;
} else {
    image_alpha = lerp_dt(image_alpha, 0, .08);
    if image_alpha <= 0.02 then instance_destroy();
}
