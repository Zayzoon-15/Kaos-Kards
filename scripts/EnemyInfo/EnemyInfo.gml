function initEnemyinfo()
{

Enemy();

globalvar enemyInfo, enemyDeck;

enemyInfo = {
    
    ///--- MAIN CREW ---///
    #region
    
    dog : new Enemy.Create("Dog the Duck",
        sDog, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(.1,.2,100,.8,.8),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.bread, actionCards.bread, actionCards.bread,
            actionCards.slash, actionCards.slash
        ],
        [kaosCards.swoop],
        Enemy.Strat(.7,1,1,.6,.7)
    ),
    
    angel : new Enemy.Create("Angel the Juvenile",
        sAngel, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(.2,.4,100,.8,.9),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.flaminAce, actionCards.flaminAce, actionCards.flaminAce,
            actionCards.laser, actionCards.laser
        ],
        [kaosCards.high],
        Enemy.Strat(.8,.4,.7,.7,.9)
    ),
    
    cock : new Enemy.Create("Cock the Bug",
        sCock, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(.2,.3,100,.8,.9),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.poison, actionCards.poison, actionCards.poison,
            actionCards.bread, actionCards.bread
        ],
        [kaosCards.brokenDefense],
        Enemy.Strat(.5,.9,.7,.8,.5)
    ),
    
    alien : new Enemy.Create("Alan the Alien",
        sAlien, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(.4,.4,100,.85,.9),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.laser, actionCards.laser, actionCards.laser,
            actionCards.slash, actionCards.slash
        ],
        [kaosCards.swap],
        Enemy.Strat(.6,.5,.7,.4,.5)
    ),
    
    ///--- BOSS ---///
    beer : new Enemy.Create("Beer the Pickle", 
        sBeer, Enemy.Anims(), Enemy.Dialogue(10,"Bitch"),
        Enemy.Difficulty(.6,.6,115,.95,1),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.punch, actionCards.punch, actionCards.punch,
            actionCards.laser, actionCards.laser, actionCards.laser,
            actionCards.bread, actionCards.flaminAce,
        ],
        [kaosCards.swoop,kaosCards.high],
        Enemy.Strat(.6,.5,.7,.4,.5),
        enemySpecialBeer,["BeerIntro",["BeerKaos1","BeerKaos2"]]
    ),
    
    #endregion
    
    
    ///--- RETRO CREW ---///
    #region
    
    handsy : new Enemy.Create("Handsy the Hand",
        sHandsy, Enemy.Anims(), Enemy.Dialogue(5,"Wah wah wah, wah wah wah wah >:)","Wah wah wah! >:D","Wah wah... :("),
        Enemy.Difficulty(.8,.9,100,1,1),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.punch, actionCards.punch, actionCards.punch,
            actionCards.ghost, actionCards.ghost,
        ],
        [kaosCards.rps],
        Enemy.Strat(.6,.5,.7,.4,.5),
    ),
    
    ///--- BOSS ---///
    chud : new Enemy.Create("Ichiro Uzumaki the Chud",
        sChud, Enemy.Anims(2,2,2,2,4,{
            kaosHotDogStart: Enemy.AnimClip(8,13,false,"idle"),
            kaosHotDogLose : Enemy.AnimClip(21,3,true)
        }), Enemy.Dialogue(),
        Enemy.Difficulty(.85,1,125,1.2,1.1),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.punch, actionCards.punch, actionCards.punch,
            actionCards.taunt, actionCards.bread, actionCards.bread,
        ],
        [kaosCards.brawl],
        Enemy.Strat(.7,.5,.8,.3,.8),
        function(){},["ChudIntro",["ChudKaos1","ChudKaos2"],"ChudMini"]
    ),
    
    #endregion
    
    
    ///--- SPOOKY CREW ---///
    #region
    
    bones : new Enemy.Create("Jones the Living Bones",
        sBones, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(5,5,135,1.5,1.5),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.flaminAce, actionCards.flaminAce, actionCards.flaminAce,
            actionCards.slash, actionCards.slash,
            actionCards.jerryCan,
        ],
        [kaosCards.hotdog],
        Enemy.Strat(.9,.6,.8,.5,1),
    ),
    
    
    #endregion
    
    
    ///--- CAMEOS ---///
    #region
    
    teto : new Enemy.Create("Kasane Teto the UTAU",
        sTeto, Enemy.Anims(2,2,2,2,2), Enemy.Dialogue(5,["Man, FUCK Complex bro"]),
        Enemy.Difficulty(.7,.6,110,1.1,1),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.bread, actionCards.bread, actionCards.bread,
            actionCards.punch, actionCards.punch,
            actionCards.steak, actionCards.steak,
        ],
        [kaosCards.hotdog,kaosCards.swoop],
        Enemy.Strat(.6,.5,.7,.4,.5),
        undefined, ["TetoPrepare","TetoKaos"]
    ),
    
    jsg : new Enemy.Create("Just Some Guy",
        sJsg, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(.7,.6,100,1.1,1),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.bread, actionCards.bread, actionCards.bread,
            actionCards.punch, actionCards.punch,
            actionCards.steak, actionCards.steak,
        ],
        [kaosCards.hotdog,kaosCards.swoop],
        Enemy.Strat(.7,.5,.7,.4,.7)
    ),
    
    pug : new Enemy.Create("Loulou the Pug",
        sPug, {idle : Enemy.AnimClip(0,41,true)}, Enemy.Dialogue(),
        Enemy.Difficulty(.2,.2,200,1,.3),
        [
            actionCards.steak, actionCards.heal,
            actionCards.shield, actionCards.shield, actionCards.shield,
            actionCards.bread, actionCards.bread, actionCards.bread,
            actionCards.laser, actionCards.laser,
            actionCards.flaminAce, actionCards.flaminAce,
            actionCards.jerryCan, actionCards.silence,
            actionCards.perro,
        ],
        [kaosCards.high,kaosCards.freeze],
        Enemy.Strat()
    ),
    
    fungi : new Enemy.Create("Fungi",
        sFungi, {idle : Enemy.AnimClip(0,59,true)}, Enemy.Dialogue(),
        Enemy.Difficulty(),
        [
            actionCards.steak, actionCards.heal,
            actionCards.shield, actionCards.shield, actionCards.shield,
            actionCards.bread, actionCards.bread, actionCards.bread,
            actionCards.silence, actionCards.silence,
            actionCards.taunt, actionCards.taunt,
        ],
        [kaosCards.high],
        Enemy.Strat()
    ),
    
    
    #endregion
};



}