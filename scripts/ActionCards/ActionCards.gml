
globalvar actionCards;

actionCards = {
    
    base: {
        name : "Action Card",
        desc : "Card Description",
        range : {min:1,max:6},
        type : CARDTYPES.ACTION,
        sprite : sBlankCard,
    },
    
    shield: {
        name : "Defense Card",
        desc : "Shields you from any harm and grants you temporary health that only lasts for the current round",
        range : {min:1,max:10},
        type : CARDTYPES.ACTION,
        sprite : sShieldCard,
    },
    
    heal: {
        name : "Heal Card",
        desc : "Heals you by a random amount",
        range : {min:1,max:10},
        type : CARDTYPES.ACTION,
        sprite : sHealCard,
    },
    
    slash: {
        name : "Slash Card",
        desc : "Slashes your enemy with a mighty sword",
        range : {min:1,max:6},
        type : CARDTYPES.ACTION,
        sprite : sSlashCard,
    },
    
    bread: {
        name : "Bread Card",
        desc : "Shoots a piece of bread at the enemy",
        range : {min:1,max:6},
        type : CARDTYPES.ACTION,
        sprite : sBreadCard,
    },
    
    laser: {
        name : "Giant F**King Laser",
        desc : "Shoots a giant f**king laser at the enemy",
        range : {min:1,max:6},
        type : CARDTYPES.ACTION,
        sprite : sLaserCard,
    },
    
    punch: {
        name : "Punch Card",
        desc : "Punches your enemy in the flipping face",
        range : {min:1,max:6},
        type : CARDTYPES.ACTION,
        sprite : sPunchCard,
    },
    
};