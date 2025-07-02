
//Touching Card
var _card = instance_place(x,y,oCard);

if !filled
{
    if _card and _card.info.type == CARDTYPES.ACTION
    {
        scale = lerp(scale,1.5,.3);
    } else scale = lerp(scale,1,.2);
}

//Scale
if filled
{
    scale = lerp(scale,1.5,.3);
}

setSize(scale,scale);