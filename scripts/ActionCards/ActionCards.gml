


function initActionCards()
{

globalvar actionCards;

actionCards = {
    
    gato : new createCardAction("Gato","It's a cat",sGato,[10000000000,10000000001],CARDACT_GENRES.ATTACK,actionLaser),
    
    heal : new createCardAction("Health Pack",
    "[g]Heals[/] you depending on cards value",
    sCardHeal,[1,12],CARDACT_GENRES.HEAL,actionHeal,[],comboHeal),
    
    shield : new createCardAction("Shield",
    "Grants you [b]temporary health[/] that reduces after every round",
    sCardShield,[1,12],CARDACT_GENRES.DEFEND,actionShield,[],comboShield),
    
    slash : new createCardAction("Mighty Sword",
    "Slashes your enemy with a mighty sword",
    sCardSlash,[1,6],CARDACT_GENRES.ATTACK,actionSlash,[],comboSlash),
    
    bread : new createCardAction("Bread",
    "Shoots a 3 slices of bread at the enemy",
    sCardBread,[1,6],CARDACT_GENRES.ATTACK,actionBread,[],comboBread),
	
    laser : new createCardAction("Giant F**King Laser",
    "Shoots a giant f**king laser at the enemy",
    sCardLaser,[1,6],CARDACT_GENRES.ATTACK,actionLaser),
    
    punch : new createCardAction("Punch",
    "Punches your enemy in the flipping face",
    sCardPunch,[1,6],CARDACT_GENRES.ATTACK,actionPunch),
    
    flaminAce : new createCardAction("Flamin' Ace",
    "[o]Burns[/] your enemy [r]alive",
    sCardFlaminAce,[1,4],CARDACT_GENRES.ATTACK,actionFlameAce),
    
    poison : new createCardAction("Poison",
    "[p]Poisons[/] your enemy for a random period of time",
    sCardPoison,[1,4],CARDACT_GENRES.ATTACK,actionPoison),
	
    mirror : new createCardAction("Mirror",
    "Reflects any [aq]physical[/] attacks attacking the card but you take some damage as well[s][lg](The range changes how much more damage the attack does)",
    sCardMirror,[0,2],CARDACT_GENRES.DEFEND,actionMirror),
	
    ghost : new createCardAction("Ghost",
    "Shoots a [aq]non physical[/] ghost that ignores [b]shields",
    sCardGhost,[1,5],CARDACT_GENRES.ATTACK,actionGhost),
	
    taunt : new createCardAction("Taunt",
    "Taunt your enemy to gain a random amount of [o]combo[/] charge and steal a random amount from them",
    sCardTaunt,[1,4],CARDACT_GENRES.ATTACK,actionTaunt),
    
    steak : new createCardAction("Juicy Steak",
    "Increase [g]max health[/] by cards value",
    sCardSteak,[0,8],CARDACT_GENRES.HEAL,actionSteak),
    
    silence : new createCardAction("Silence",
    "A chance to silence the the card in front of it[s][lg](The higher the value the higher the chance of silencing the card)",
    sCardMirror,[0,10],CARDACT_GENRES.DEFEND,actionSilence),
    
    jerryCan : new createCardAction("Jerry Can",
    "All [o]fire effects[/] currently active create an [r]explosion[/] and get removed",
    sCardFlaminAce,[4,9],CARDACT_GENRES.ATTACK,actionJerryCan),
    
    bodyslam : new createCardAction("Body Slam",
    "Turn a percentage of your [b]shield[/] into [r]damage[/]",
    sCardShield,[35,65],CARDACT_GENRES.ATTACK,actionBodySlam),
    
    fiary : new createCardAction("Fairy Bottle",
    "bottle",
    sCardShield,[1,7],CARDACT_GENRES.ATTACK,actionBodySlam),
    
    //CONCEPT
    burger : new createCardAction("Burger",
    "[g]Heals[/] you a great amount but the amount it [g]heals[/] [o]decreases[/] every use[s][lg](The healing can go negative, damaging you)",
    sCardBurger,[10,20],CARDACT_GENRES.HEAL,actionBurger,[],undefined,[],actionAfterRangeBurger),
    
    reckless : new createCardAction("Reckless Attack",
    "Deal high damage to the enemy, but take a small amount of recoil damage",
    sCardPunch,[5,9],CARDACT_GENRES.ATTACK,actionReckless),
    
};



}