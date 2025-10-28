


function initActionCards()
{



globalvar actionCards;

actionCards = {
    
    heal : new createCard("Heal Card",
    "Heals you by a random amount",
    {min:1,max:10},CARDTYPES.ACTION,sCardHeal,healAction),
    
    shield : new createCard("Defense Card",
    "Grants you temporary health that reduces after every round",
    {min:1,max:10},CARDTYPES.ACTION,sCardShield,shieldAction),
    
    slash : new createCard("Slash Card",
    "Slashes your enemy with a mighty sword",
    {min:1,max:6},CARDTYPES.ACTION,sCardSlash,slashAction),
    
    bread : new createCard("Bread Card",
    "Shoots a 3 slices of bread at the enemy",
    {min:1,max:6},CARDTYPES.ACTION,sCardBread,breadAction),
	
    laser : new createCard("Giant F**King Laser",
    "Shoots a giant f**king laser at the enemy",
    {min:1,max:6},CARDTYPES.ACTION,sCardLaser,laserAction),
    
    punch : new createCard("Punch Card",
    "Punches your enemy in the flipping face",
    {min:1,max:6},CARDTYPES.ACTION,sCardPunch,punchAction),
    
    flamingAce : new createCard("Flaming Ace",
    "Burns your enemy alive",
    {min:1,max:4},CARDTYPES.ACTION,sCardFlaminAce,flameAceAction),
    
    poison : new createCard("Poison Card",
    "Poisons your enemy for a random period of time",
    {min:1,max:4},CARDTYPES.ACTION,sCardPoison,poisonAction),
	
    mirror : new createCard("Mirror Card",
    "Reflects any physical attacks attacking the card. The range effects how the damage is changed",
    {min:1,max:2},CARDTYPES.ACTION,sCardMirror,mirrorAction),
    
};



}