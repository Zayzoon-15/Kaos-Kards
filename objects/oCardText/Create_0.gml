//DON'T TOUCH THESE
height = 0;
width = 0;
textAlpha = 0;

//Box Setup
heightMargin = 10;
widthMargin = 10;
maxWidth = 230;

//Setup Text
text = $"\n\n{desc}";
if range != undefined then text += $"\nRange: {range.min} - {range.max}";
if !is_nan(uses)
{
    if uses > 1
    {
        text += $"\nUses Left: {uses}";
    } else if uses != 0
    {
        text += $"\nUse Left: {uses}";
    } else text += $"\nNO USES LEFT";
}