function initEnemyinfo()
{


globalvar enemyInfo, enemyDeck;

enemyInfo = {
    
    //Main Crew
    dog : new enemyCreate("Dog the Duck",sDog,enemyCreateAnims(),.3,.3,[actionCards.heal,actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.bread,actionCards.bread,actionCards.bread,actionCards.slash,actionCards.slash],[kaosCards.swoop],new enemyCreateStrat(30,60,20,70,70,2,80,0)),
    
    angel : new enemyCreate("Angel the Juvenile",sAngel,enemyCreateAnims(),.5,.5,[actionCards.heal,actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.flamingAce,actionCards.flamingAce,actionCards.flamingAce,actionCards.laser,actionCards.laser],[kaosCards.high],new enemyCreateStrat(40,60,20,60,80,2,90,0)),
    
    cock : new enemyCreate("Cock the Bug",sCock,enemyCreateAnims(),.6,.4,[actionCards.heal,actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.poison,actionCards.poison,actionCards.poison,actionCards.bread,actionCards.bread],[kaosCards.destroy],new enemyCreateStrat(60,70,50,75,70,2,80,0)),
	
    alien : new enemyCreate("Alan the Alien",sAlien,enemyCreateAnims(),.7,.8,[actionCards.heal,actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.laser,actionCards.laser,actionCards.laser,actionCards.bread,actionCards.bread],[kaosCards.swap,kaosCards.freeze],new enemyCreateStrat(70,60,40,70,75,2,90,0)),
    
    beer : new enemyCreate("Beer the Pickle",sBeer,enemyCreateAnims(),1,1,[actionCards.heal,actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.punch,actionCards.punch,actionCards.punch,actionCards.laser,actionCards.laser],[kaosCards.rps],new enemyCreateStrat(80,70,50,75,30,2,100,50,4),enemySpecialBeer),
    
    //Retro Crew
    chud : new enemyCreate("Ichiro Uzumaki the Chud",sChud,enemyCreateAnims(2,2,2,2,{kaosHotDogStart:enemyCreateAnimClips(13,8,false),kaosHotDogLose:enemyCreateAnimClips(3,21,true)}),1.2,3,[actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.bread,actionCards.bread,actionCards.flamingAce,actionCards.taunt,actionCards.mirror,actionCards.mirror,actionCards.mirror],[kaosCards.brawl],new enemyCreateStrat(80,80,20,75,65,2,100,0)),
    
    handsy : new enemyCreate("Handsy the Hand",sHandsy,enemyCreateAnims(),1.3,2,[actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.punch,actionCards.punch,actionCards.punch,actionCards.ghost,actionCards.ghost],[kaosCards.sticky],new enemyCreateStrat(80,70,50,80,80,2,100,0)),
    
    //Spooky Crew
    bones : new enemyCreate("Jones the Living Bones",sBones,enemyCreateAnims(),2,4,[actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.slash,actionCards.slash,actionCards.flamingAce,actionCards.flamingAce,actionCards.flamingAce],[kaosCards.hotdog],new enemyCreateStrat(90,70,80,85,40,2,100,0)),
    
    
    
    //Cameo
    teto : new enemyCreate("Kasane Teto the UTAU",sTeto,enemyCreateAnims(),1.5,2,[actionCards.heal,actionCards.heal,actionCards.heal,actionCards.shield,actionCards.shield,actionCards.bread,actionCards.bread,actionCards.bread,actionCards.punch,actionCards.punch,actionCards.laser,actionCards.taunt],[kaosCards.swoop,kaosCards.hotdog],new enemyCreateStrat(80,80,20,75,45,2,100,0),undefined,["TetoPrepare","TetoKaos"]),
    
};



}