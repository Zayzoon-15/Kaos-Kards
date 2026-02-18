//Can Press
if touchingMouse() and !oDeckBuilder.transition and !global.midTrans
{
    //Hover
    //scale = 1.1;
    yOffset = lerp(yOffset,-3,.3);
    shadowOffset = lerp(shadowOffset,8,.3);
    
    //Press
    canPress = global.deckCardAmount > 0;
} else {
    //Hover
    scale = 1;
    yOffset = lerp(yOffset,0,.3);
    shadowOffset = lerp(shadowOffset,5,.3);
    
    //Press
    canPress = false;
    pressed = false;
}

xscale = lerp(xscale,scale,.2);
yscale = lerp(yscale,scale,.2);