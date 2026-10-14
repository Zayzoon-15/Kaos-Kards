//No More Cards
if cardsLeft <= 0 {
    grabbable = false;
}

//Grabbed
if grabbed {
    
    //Set Shadow
    shadowTargetSize = baseShadowSize;
    shadowTargetAlpha = 1;
    
} else {

    //Set Shadow
    shadowTargetSize = .2;
    shadowTargetAlpha = 0;
    
    //Set Size
    scaleTargetX = 1;
    scaleTargetY = 1;
}

//Set Position
placedX = global.stickItemsToScreen ? getPosToWindow(true) : xstart;
placedY = ystart - cardsLeft * cardDeckSep;

//Set Can Hover
canHover = !global.holdingCard and !global.menuOpen;

//Set Touching Stack
touchingStack = point_in_rectangle(mouse_x,mouse_y,x-sprite_width/2,y-sprite_height/2,x+sprite_width/2,ystart+ sprite_get_height(sDeck)/2);

//Player Only Stuff
if room == rPrepare {
    
    //Draw Cards
    if cardsInPlay < global.handsize and drawTime <= 0 and cardsLeft > 0
    {
        drawCard();
    } else drawTime --;
    
    //Tip Box
    drawTipBox( cardsLeft > 1 ?
        $"Your deck of cards\nYou have {cardsLeft} cards left" :
        $"Your deck of cards\nYou have {cardsLeft} card left" //Slight grammer fix
    );
    
}