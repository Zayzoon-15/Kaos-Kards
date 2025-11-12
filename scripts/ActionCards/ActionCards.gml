


function initActionCards()
{



globalvar actionCards;

actionCards = {
    
    gato : new createCardAction("Gato","Its a cat",sGato,[1,99],actionLaser),
    
    heal : new createCardAction("Heal Card",
    "Heals you by a random amount",
    sCardHeal,[1,10],actionHeal),
    
    shield : new createCardAction("Defense Card",
    "Grants you temporary health that reduces after every round",
    sCardShield,[1,10],actionShield),
    
    slash : new createCardAction("Slash Card",
    "Slashes your enemy with a mighty sword",
    sCardSlash,[1,6],actionSlash),
    
    bread : new createCardAction("Bread Card",
    "Shoots a 3 slices of bread at the enemy",
    sCardBread,[1,6],actionBread),
	
    laser : new createCardAction("Giant F**King Laser",
    "Shoots a giant f**king laser at the enemy",
    sCardLaser,[1,6],actionLaser),
    
    punch : new createCardAction("Punch Card",
    "Punches your enemy in the flipping face",
    sCardPunch,[1,6],actionPunch),
    
    flamingAce : new createCardAction("Flaming Ace",
    "Burns your enemy alive",
    sCardFlaminAce,[1,4],actionFlameAce),
    
    poison : new createCardAction("Poison Card",
    "Poisons your enemy for a random period of time",
    sCardPoison,[1,4],actionPoison),
	
    mirror : new createCardAction("Mirror Card",
    "Reflects any physical attacks attacking the card\nThe range changes how much more damage the attack does",
    sCardMirror,[0,2],actionMirror),
    
};



}