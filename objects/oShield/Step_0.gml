//Animation Curve
curvePos += curveSpd;
var _curveStruct = animcurve_get(acAttackCard);
var _channel = animcurve_get_channel(_curveStruct,"shieldAlpha");
var _value = animcurve_channel_evaluate(_channel,curvePos);

image_alpha = _value;

setSize(image_xscale+0.01,image_yscale+0.01);

//Destroy
if curvePos == 1
{
    instance_destroy();
}