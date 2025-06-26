
//Toucing Card
var _card = instance_place(x,y,oCard);

if filled and !used
{
    scale = lerp(scale,1.5,.3);
} else
{
    if _card and _card.cardInfo.type != "Action" and !used
    {
        scale = lerp(scale,1.5,.3);
    } else scale = lerp(scale,1,.2);
}

//Used
if used
{
    image_alpha = lerp(image_alpha,.7,.2);
} else image_alpha = lerp(image_alpha,1,.3);

//Set Size
setSize(scale,scale);