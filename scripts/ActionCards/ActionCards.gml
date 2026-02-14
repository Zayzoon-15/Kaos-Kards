


function initActionCards()
{

globalvar actionCards;

actionCards = {
    
    gato : new createCardAction("Gato","Its a cat",sGato,[1,69],CARDACT_GENRES.ATTACK,actionLaser),
    
    heal : new createCardAction("Heal Card",
    "Heals you by a random amount",
    sCardHeal,[1,10],CARDACT_GENRES.HEAL,actionHeal,[],comboHeal),
    
    shield : new createCardAction("Shield Card",
    "Grants you temporary health that reduces after every round",
    sCardShield,[1,10],CARDACT_GENRES.DEFEND,actionShield,[],comboShield),
    
    slash : new createCardAction("Slash Card",
    "Slashes your enemy with a mighty sword",
    sCardSlash,[1,6],CARDACT_GENRES.ATTACK,actionSlash,[],comboSlash),
    
    bread : new createCardAction("Bread Card",
    "Shoots a 3 slices of bread at the enemy",
    sCardBread,[1,6],CARDACT_GENRES.ATTACK,actionBread,[],comboBread),
	
    laser : new createCardAction("Giant F**King Laser",
    "Shoots a giant f**king laser at the enemy",
    sCardLaser,[1,6],CARDACT_GENRES.ATTACK,actionLaser),
    
    punch : new createCardAction("Punch Card",
    "Punches your enemy in the flipping face",
    sCardPunch,[1,6],CARDACT_GENRES.ATTACK,actionPunch),
    
    flamingAce : new createCardAction("Flaming Ace",
    "Burns your enemy alive",
    sCardFlaminAce,[1,4],CARDACT_GENRES.ATTACK,actionFlameAce),
    
    poison : new createCardAction("Poison Card",
    "Poisons your enemy for a random period of time",
    sCardPoison,[1,4],CARDACT_GENRES.ATTACK,actionPoison),
	
    mirror : new createCardAction("Mirror Card",
    "Reflects any physical attacks attacking the card\nThe range changes how much more damage the attack does",
    sCardMirror,[0,2],CARDACT_GENRES.DEFEND,actionMirror),
	
    ghost : new createCardAction("Ghost Card",
    "Shoots a non physical ghost that ignores shields",
    sCardGhost,[1,4],CARDACT_GENRES.ATTACK,actionGhost),
	
    taunt : new createCardAction("Taunt",
    "Taunt your enemy to gain a random amount of combo charge and steal a random amount from them",
    sCardTaunt,[1,4],CARDACT_GENRES.ATTACK,actionTaunt),
    
    steak : new createCardAction("Juicy Steak",
    "Increase max health by a random amount",
    sCardSteak,[0,5],CARDACT_GENRES.HEAL,actionSteak),
    
    //CONCEPT
    reckless : new createCardAction("Reckless Attack",
    "Deal high damage to the enemy, but take a small amount of recoil damage",
    sCardPunch,[5,9],CARDACT_GENRES.ATTACK,actionReckless),
    
};



}