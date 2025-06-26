cardName = "Name";
cardDesc = "Desc";

//Info
setSize(info.boxsize.width,info.boxsize.height);
cardName = info.name;
cardDesc = info.desc;
cardRange = info.range;
textY = info.textYOffset;

if info.range == undefined
{
    drawRange = false;
} else drawRange = true;