
var _card = instance_place(x,y,oCard);

if filled
{
    scale = lerp(scale,1.5,.3);
} else
{
    if _card and _card.cardInfo.type == "Action"
    {
        scale = lerp(scale,1.5,.3);
    } else scale = lerp(scale,1,.2);
}

setSize(scale,scale);