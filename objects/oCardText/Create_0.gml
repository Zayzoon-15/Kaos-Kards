//Setup Text
textAlpha = 0;
text = desc;
textInfo = {x:x,y:y,w:0,h:0};

//Flip
flipInfo = false;

//Add Uses
if !is_nan(uses)
{
    //Normal Uses
    if array_contains([rPrepare,rKaos,rEnemy],room)
    {
        if uses > 1
        {
            text += $"[s][lg]({uses} Uses Left)";
        } else if uses != 0
        {
            text += $"[s][lg]({uses} Use Left)";
        } else text += $"[s][lg](NO USES LEFT)";
    } else { //Outside Game Uses
        if uses > 1
        {
            text += $"[s][lg]({uses} Uses Per Game)";
        } else if uses != 0
        {
            text += $"[s][lg]({uses} Use Per Game)";
        }
    }
}

//Add Range
if range != undefined then text += $"[s][s][m]Range: {range.min} - {range.max}";

//Box Color
boxColor = c_white;
switch (type) {
	case CARDTYPES.ACTION: boxColor = #A09BB7 break;
    case CARDTYPES.DICE: boxColor = #9BADB7 break;
	case CARDTYPES.KAOS: boxColor = #AEB79B break;
}