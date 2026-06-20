function initEnemyinfo()
{

Enemy();

globalvar enemyInfo, enemyDeck;

enemyInfo = {
    
    ///--- MAIN CREW ---///
    #region
    
    dog : new Enemy.Create("Dog the Duck",
        sDog, Enemy.Anims(2,2,2,2,2), Enemy.Dialogue(),
        Enemy.Difficulty(.1,.2,100,.62,.6),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.bread, actionCards.bread, actionCards.bread,
            actionCards.slash, actionCards.slash
        ],
        [kaosCards.swoop],
        Enemy.Strat(.7,0.3,0.3,.6,1.3), [actionCards.bread,actionCards.bread,kaosCards.swoop]
    ),
    
    cock : new Enemy.Create("Cock the Bug",
        sCock, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(.1,.2,90,.8,.8),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.punch, actionCards.punch, actionCards.punch,
            actionCards.bread, actionCards.bread
        ],
        [kaosCards.destroy],
        Enemy.Strat(.5,.6,.7,.4,.4), [actionCards.bread,actionCards.bread,kaosCards.destroy]
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
        Enemy.Strat(.8,.4,.7,.7,.9), [actionCards.flaminAce,actionCards.flaminAce,kaosCards.high]
    ),
    
    alien : new Enemy.Create("Alan the Alien",
        sAlien, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(.35,.4,100,.85,.9),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.laser, actionCards.laser, actionCards.laser,
            actionCards.slash, actionCards.slash
        ],
        [kaosCards.swap],
        Enemy.Strat(.6,.5,.7,.4,.5), [actionCards.laser,actionCards.laser,kaosCards.swap]
    ),
    
    ///--- BOSS ---///
    beer : new Enemy.Create("Beer the Pickle", 
        sBeer, Enemy.Anims(), Enemy.Dialogue(10,"Bitch"),
        Enemy.Difficulty(.5,.6,115,.95,1),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.punch, actionCards.punch, actionCards.punch,
            actionCards.laser, actionCards.laser, actionCards.laser,
            actionCards.bread, actionCards.flaminAce,
        ],
        [kaosCards.swoop,kaosCards.high],
        Enemy.Strat(.6,.5,.7,.4,.6), [actionCards.punch,actionCards.punch,kaosCards.high],
        enemySpecialBeer,["BeerIntro",["BeerKaos1","BeerKaos2"]]
    ),
    
    #endregion
    
    
    ///--- RETRO CREW ---///
    #region
    
    handsy : new Enemy.Create("Handsy the Hand",
        sHandsy, Enemy.Anims(), Enemy.Dialogue(5,"Wah wah wah, wah wah wah wah >:)","Wah wah wah! >:D","Wah wah... :("),
        Enemy.Difficulty(.6,.9,100,.95,1),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.punch, actionCards.punch, actionCards.punch,
            actionCards.ghost, actionCards.ghost,
        ],
        [kaosCards.rps],
        Enemy.Strat(.6,.5,.7,.4,.5), [actionCards.punch,actionCards.punch,kaosCards.rps]
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
            actionCards.taunt, actionCards.laser, actionCards.laser,
        ],
        [kaosCards.brawl],
        Enemy.Strat(.7,.5,.8,.3,.7), [actionCards.taunt,actionCards.taunt,kaosCards.brawl],
        function(){},["ChudIntro",["ChudKaos1","ChudKaos2"],"ChudMini"]
    ),
    
    #endregion
    
    
    ///--- SPOOKY CREW ---///
    #region
    
    bones : new Enemy.Create("Jones the Living Bones",
        sBones, Enemy.Anims(), Enemy.Dialogue(),
        Enemy.Difficulty(1,5,135,3,3),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.flaminAce, actionCards.flaminAce, actionCards.flaminAce,
            actionCards.jerryCan, actionCards.jerryCan,
            actionCards.mirror,
        ],
        [kaosCards.hotdog],
        Enemy.Strat(.95,.6,.8,.4,1), [actionCards.taunt,actionCards.taunt,actionCards.taunt]
    ),
    
    
    #endregion
    
    
    ///--- CAMEOS ---///
    #region
    
    teto : new Enemy.Create("Kasane Teto the UTAU",
        sTeto, Enemy.Anims(2,2,2,2,2), Enemy.Dialogue(5,["Man, FUCK Complex bro","MAN FUCK YOU","MMMMM Bread..."]),
        Enemy.Difficulty(.75,1.1,110,1.1,1),
        [
            actionCards.heal, actionCards.heal,
            actionCards.shield, actionCards.shield,
            actionCards.bread, actionCards.bread, actionCards.bread,
            actionCards.punch, actionCards.punch,
            actionCards.steak, actionCards.steak,
        ],
        [kaosCards.hotdog,kaosCards.swoop],
        Enemy.Strat(.7,.5,.7,.4,.5), [actionCards.taunt,actionCards.taunt,actionCards.taunt],
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
            actionCards.burger,
        ],
        [kaosCards.hotdog,kaosCards.swoop],
        Enemy.Strat(.7,.5,.7,.4,.7), [actionCards.taunt,actionCards.taunt,actionCards.taunt]
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
        Enemy.Strat(), [actionCards.taunt,actionCards.taunt,actionCards.taunt]
    ),
    
    fungi : new Enemy.Create("Fungi",
        sFungi, {idle : Enemy.AnimClip(0,59,true)}, Enemy.Dialogue(),
        Enemy.Difficulty(),
        [
            actionCards.steak, actionCards.heal,
            actionCards.shield, actionCards.shield, actionCards.shield,
            actionCards.silence, actionCards.silence,
            actionCards.taunt, actionCards.taunt,
            actionCards.poison, actionCards.poison, actionCards.poison,
            actionCards.bread, actionCards.slash
        ],
        [kaosCards.high,kaosCards.destroy],
        Enemy.Strat(), [actionCards.taunt,actionCards.taunt,actionCards.taunt]
    ),
    
    
    #endregion
};



}