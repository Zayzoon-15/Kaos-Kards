#region --- Lilguys ---

//Loner
loner = {
    x : x,
    y : y + 50,
    targetX : ROOM_CENTER.x,
    targetY : ROOM_CENTER.y,
    show : true,
    alpha : 0,
    targetAlpha : 1,
}

//Hugger
hugger = {
    x : room_width,
    y : y,
    targetX : room_width,
    targetY : ROOM_CENTER.y,
    show : true,
    alpha : 0,
    targetAlpha : 0,
}

//Move Hugger In
timeSourceCreate(1,function(){ 
    
    //Set Loner
    loner.targetX -= 20;
    
    //Set Hugger
    hugger.targetX = ROOM_CENTER.x + 30;
    hugger.targetAlpha = 1;
});

//Hug
timeSourceCreate(2.5,function(){ 
    
    //Hide Lilguys
    loner.show = false;
    hugger.show = false;
    
    //Set Position
    x = ROOM_CENTER.x;
    y = ROOM_CENTER.y;
    
    //Juice
    setSize(.6,1.4);
    effectHearts(x,bbox_top+30,irandom_range(3,5));
    
    //Alert
    createAlertMessage("Health bars connected");
});

//Go Away
timeSourceCreate(4.3,function(){ 
    
    //Destroy
    effectStar(x,y,8,true,10,15);
    instance_destroy();
    
    //Finish Kaos
    eventKaosCardDone();
});

#endregion