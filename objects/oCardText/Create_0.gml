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
textSmall = "";

//Add Range
if range != undefined then textSmall += $"\nRange: {range.min} - {range.max}";
if !is_nan(uses)
{
    //Normal Uses
    if array_contains([rPrepare,rKaos,rEnemy],room)
    {
        if uses > 1
        {
            textSmall += $"\n({uses} Uses Left)";
        } else if uses != 0
        {
            textSmall += $"\n({uses} Use Left)";
        } else textSmall += $"\n(NO USES LEFT)";
    } else { //Outside Game Uses
        if uses > 1
        {
            textSmall += $"\n({uses} Uses Per Game)";
        } else if uses != 0
        {
            textSmall += $"\n({uses} Use Per Game)";
        }
    }
}

//Combine Text
text += textSmall;