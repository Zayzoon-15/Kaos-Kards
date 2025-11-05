//Check Target Type
if targetType2 == undefined then targetType2 = targetType1;

//Set Disabled
if disabled then used = true;

//Touching Card
card = instance_place(x,y,oCard);
if !filled and !used
{
    if card and (card.info.type == targetType1 or card.info.type == targetType2)
    {
        scale = lerp(scale,1.15,.3);
    } else scale = lerp(scale,1,.2);
}

//Filled
if filled and !used
{
    scale = lerp(scale,1.3,.3);
}

//Used
if used
{
    scale = lerp(scale,1,.2);
    image_alpha = lerp(image_alpha,.7,.2);
} else image_alpha = lerp(image_alpha,1,.2);