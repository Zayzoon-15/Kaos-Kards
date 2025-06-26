#region Card Juice

//Angle Cards
var _angle = ((room_width/2) - x)*.02;

image_angle = lerp(image_angle,0,.2);

var _allElements = layer_get_all_elements("SpecialSlot");
for (var i = 0; i < array_length(_allElements); i++)
{
    if (layer_get_element_type(_allElements[i]) == layerelementtype_sprite)
    {
        layer_sprite_xscale(_allElements[i],1.5);
        layer_sprite_yscale(_allElements[i],1.5);
    }
}

#endregion

//Hovered
if touchingMouse() and !global.holdingCard
{
    targetY = ystart - 10;
    shadowY = lerp(shadowY,14,.2);
    if !instance_exists(oInfoBox)
    {
        var _inst = showInfoBox(cardInfo);
        _inst.parent = self;
    }
} else {
	targetY = ystart;
    shadowY = lerp(shadowY,6,.2);
}

targetX = xstart;

//Shadow
var _shadowX = (x - (room_width/2))*.03;
shadowX = lerp(shadowX,_shadowX,.2);
shadowX = clamp(shadowX,-7,7);
shadowSize = lerp(shadowSize,0.05,.2);

//Ease
x = lerp(x,targetX,.2);
y = lerp(y,targetY,.2);
image_xscale = lerp(image_xscale,1,.2);
image_yscale = lerp(image_yscale,1,.2);