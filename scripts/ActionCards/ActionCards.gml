


function initActionCards()
{



globalvar actionCards;

actionCards = {
    
    heal : new createCardAction("Heal Card",
    "Heals you by a random amount",
    sCardHeal,[1,10],healAction),
    
    shield : new createCardAction("Defense Card",
    "Grants you temporary health that reduces after every round",
    sCardShield,[1,10],shieldAction),
    
    slash : new createCardAction("Slash Card",
    "Slashes your enemy with a mighty sword",
    sCardSlash,[1,6],slashAction),
    
    bread : new createCardAction("Bread Card",
    "Shoots a 3 slices of bread at the enemy",
    sCardBread,[1,6],breadAction),
	
    laser : new createCardAction("Giant F**King Laser",
    "Shoots a giant f**king laser at the enemy",
    sCardLaser,[1,6],laserAction),
    
    punch : new createCardAction("Punch Card",
    "Punches your enemy in the flipping face",
    sCardPunch,[1,6],punchAction),
    
    flamingAce : new createCardAction("Flaming Ace",
    "Burns your enemy alive",
    sCardFlaminAce,[1,4],flameAceAction),
    
    poison : new createCardAction("Poison Card",
    "Poisons your enemy for a random period of time",
    sCardPoison,[1,4],poisonAction),
	
    mirror : new createCardAction("Mirror Card",
    "Reflects any physical attacks attacking the card\nThe range changes how much more damage the attack does",
    sCardMirror,[0,4],mirrorAction),
    
};



}