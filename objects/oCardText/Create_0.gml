
//DONT TOUCH THESE
height = 0;
width = 0;
textAlpha = 0;

//Box Setup
heightMargin = 10;
widthMargin = 10;
maxWidth = 230;

//Setup Text
text = "";
if range != undefined //Make Sure Range Is real
{
    text = $"\n\n{desc}\nRange: {range.min} - {range.max}";
} else text = $"\n\n{desc}"; //In Case There's No Range

