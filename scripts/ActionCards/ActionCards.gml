
/*


function initActionCards()
{

globalvar actionCards;

actionCards = {
    
    gato : new createActionCards("Gato","It's a cat",sGato,[10000000000,10000000001],[60 * 5,-20],CARDACT_GENRES.ATTACK,actionLaser),
    perro : new createActionCards("Perro","It's a dog",sPerro,[9360,9360],[60 * 5,-20],CARDACT_GENRES.ATTACK,actionLaser),
    
    heal : new createActionCards("Health Pack",
    "[g]Heals[/] you depending on cards value",
    sCardHeal,[1,12],[30,-10],CARDACT_GENRES.HEAL,actionHeal,comboHeal),
    
    shield : new createActionCards("Shield",
    "Grants you [b]temporary health[/] that reduces after every round",
    sCardShield,[1,12],[30,0],CARDACT_GENRES.DEFEND,actionShield,comboShield),
    
    slash : new createActionCards("Mighty Sword",
    "Slashes your enemy with a mighty sword",
    sCardSlash,[1,6],[0,0],CARDACT_GENRES.ATTACK,actionSlash,comboSlash),
    
    bread : new createActionCards("Bread",
    "Shoots a 3 slices of bread at the enemy",
    sCardBread,[1,6],[-20,10],CARDACT_GENRES.ATTACK,actionBread,comboBread),
	
    laser : new createActionCards("Giant F**King Laser",
    "Shoots a giant f**king laser at the enemy",
    sCardLaser,[1,6],[20,20],CARDACT_GENRES.ATTACK,actionLaser),
    
    punch : new createActionCards("Punch",
    "Punches your enemy in the flipping face",
    sCardPunch,[1,6],[-20,-10],CARDACT_GENRES.ATTACK,actionPunch),
    
    flaminAce : new createActionCards("Flamin' Ace",
    "[o]Burns[/] your enemy [r]alive",
    sCardFlaminAce,[1,4],[20,0],CARDACT_GENRES.ATTACK,actionFlameAce),
    
    poison : new createActionCards("Poison",
    "[p]Poisons[/] your enemy for a random period of time",
    sCardPoison,[1,4],[0,10],CARDACT_GENRES.ATTACK,actionPoison),
	
    mirror : new createActionCards("Mirror",
    "Reflects any [aq]physical[/] attacks attacking the card but you take some damage as well[s][lg](The range changes how much more damage the attack does)",
    sCardMirror,[0,2],[30,-20],CARDACT_GENRES.DEFEND,actionMirror),
	
    ghost : new createActionCards("Ghost",
    "Shoots a [aq]non physical[/] ghost that ignores [b]shields",
    sCardGhost,[1,5],[0,-10],CARDACT_GENRES.ATTACK,actionGhost),
	
    taunt : new createActionCards("Taunt",
    "Taunt your enemy to gain a random amount of [o]combo[/] charge and steal a random amount from them",
    sCardTaunt,[1,4],[20,-10],CARDACT_GENRES.ATTACK,actionTaunt),
    
    steak : new createActionCards("Juicy Steak",
    "Increase [g]max health[/] by cards value",
    sCardSteak,[0,7],[30,-10],CARDACT_GENRES.HEAL,actionSteak),
    
    silence : new createActionCards("Silence",
    "A chance to silence the the card in front of it[s][lg](The higher the value the higher the chance of silencing the card)",
    sCardSilence,[0,10],[30,0],CARDACT_GENRES.DEFEND,actionSilence),
    
    jerryCan : new createActionCards("Jerry Can",
    "All [o]fire effects[/] currently active create an [r]explosion[/] and get removed",
    sCardFlaminAce,[4,9],[60,0],CARDACT_GENRES.ATTACK,actionJerryCan),
    
    bodyslam : new createActionCards("Body Slam",
    "Turn a percentage of your [b]shield[/] into [r]damage[/]",
    sCardShield,[35,65],[60,20],CARDACT_GENRES.ATTACK,actionBodySlam),
    
    fiary : new createActionCards("Fairy Bottle",
    "bottle",
    sCardShield,[1,7],[0,60],CARDACT_GENRES.ATTACK,actionBodySlam),
    
    //CONCEPT
    burger : new createActionCards("Burger",
    "[g]Heals[/] you a great amount but the amount it [g]heals[/] [o]decreases[/] every use[s][lg](The healing can go negative, damaging you)",
    sCardBurger,[10,20],[30,-10],CARDACT_GENRES.HEAL,actionBurger,undefined,actionAfterRangeBurger),
    
    reckless : new createActionCards("Reckless Attack",
    "Deal high damage to the enemy, but take a small amount of recoil damage",
    sCardPunch,[5,9],[50,50],CARDACT_GENRES.ATTACK,actionReckless),
    
};



}