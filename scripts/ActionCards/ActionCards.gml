function initActionCards()
{



globalvar actionCards;

actionCards = {
    
    shield: new createCard("Defense Card",
    "Shields you from any harm and grants you temporary health that only lasts for the current round",
    {min:1,max:10},CARDTYPES.ACTION,sShieldCard,shieldAction),
    
    heal : new createCard("Heal Card",
    "Heals you by a random amount",
    {min:1,max:10},CARDTYPES.ACTION,sHealCard,healAction),
    
    slash : new createCard("Slash Card",
    "Slashes your enemy with a mighty sword",
    {min:1,max:6},CARDTYPES.ACTION,sSlashCard,slashAction),
    
    bread : new createCard("Bread Card",
    "Shoots a piece of bread at the enemy",
    {min:1,max:6},CARDTYPES.ACTION,sBreadCard),
    
    laser : new createCard("Giant F**King Laser",
    "Shoots a giant f**king laser at the enemy",
    {min:1,max:6},CARDTYPES.ACTION,sLaserCard),
    
    punch : new createCard("Punch Card",
    "Punches your enemy in the flipping face",
    {min:1,max:6},CARDTYPES.ACTION,sPunchCard),
    
    flamingAce : new createCard("Flaming Ace",
    "Burns your enemy alive",
    {min:1,max:6},CARDTYPES.ACTION,sFlaminAce),
    
    
};



}