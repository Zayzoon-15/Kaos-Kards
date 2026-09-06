  
//Card Types
enum CARDTYPES {
	ACTION,
    DICE,
    KAOS
}

//Card Genres
enum CARDACT_GENRES {
	HEAL,
    DEFEND,
    ATTACK
}


function createCardAction(_name = "Name",_desc = "Description",_sprite = sCardBlank,_range = [1, 6],_showSpd = CARD_SHOW_SPD,_attackSpd = CARD_ATTACK_SPD,_genre = CARDACT_GENRES.ATTACK,_uses = NaN, _banned = false) constructor {
    
    //Info
    name = _name;
    desc = _desc;
    sprite = _sprite;
    
    uses = _uses;
    banned = _banned;
    date = $"{current_month}/{current_day}/{current_year}/{current_hour}";
    
    genre = _genre;
    type = CARDTYPES.ACTION;
    
    //Stats
    range = _range;
    showSpd = _showSpd;
    attackSpd = _attackSpd;
    
    //Placement
    global.deckPlacementId ++;   
    placementId = global.deckPlacementId;
    
    //Custom Functions
	static use = function(_card = oCard, _targetEnemy = true) {
        
	}
    
	static combo = function(_card = oCard, _targetEnemy = true) {
        
	}
    
	static afterRange = function(_card = oCard, _targetEnemy = true,_curValue = 0) {
        
	}
	
	//Built In Functions (Object Events)
	static create = function(_card = oCard, _targetEnemy = true) {
		
	}
	
	static update = function(_card = oCard, _targetEnemy = true) {
		
	}
}

function createCardKaos(_name = "Name",_desc = "Description",_sprite = sCardBlank,_uses = NaN, _banned = false) constructor {
    
    //Info
    name = _name;
    desc = _desc;
    sprite = _sprite;
    
    uses = _uses;
    banned = _banned;
    date = $"{current_month}/{current_day}/{current_year}/{current_hour}";
    
    genre = 0;
    type = CARDTYPES.KAOS;
    
    //Stats
    range = undefined;
    showSpd = 70;
    attackSpd = 60;
    
    //Placement
    global.deckPlacementId ++;   
    placementId = global.deckPlacementId;
    
    //Custom Functions
	static use = function(_card = oCard, _targetEnemy = true) {
        
	}
    
	static afterRange = function(_card = oCard, _targetEnemy = true) {
        
	}
	
	//Built In Functions (Object Events)
	static create = function(_card = oCard, _targetEnemy = true) {
		
	}
	
	static update = function(_card = oCard, _targetEnemy = true) {
		
	}
}

function createCardDice(_name = "Name",_desc = "Description",_sprite = sCardBlank,_targetsDice = false,_range = [1, 6],_uses = NaN, _banned = false) constructor {
    
    //Info
    name = _name;
    desc = _desc;
    sprite = _sprite;
    
    uses = _uses;
    banned = _banned;
    date = $"{current_month}/{current_day}/{current_year}/{current_hour}";
    
    genre = 0;
    type = CARDTYPES.DICE;
    
    //Stats
	targetsDice = _targetsDice;
    range = _range;
    showSpd = -1;
    attackSpd = -1;
    
    //Sound
    targetSoundOn = [snDiceLockOn1,snDiceLockOn2,snDiceLockOn3,snDiceLockOn4];
    targetSoundOff = [snDiceLockOff1,snDiceLockOff2,snDiceLockOff3,snDiceLockOff4];
    
    //Placement
    global.deckPlacementId ++;   
    placementId = global.deckPlacementId;
    
    //Custom Functions
	static use = function(_card = oCard, _targetEnemy = true) {
        
	}
    
	static afterRange = function(_card = oCard, _targetEnemy = true) {
        
	}
	
	//Built In Functions (Object Events)
	static create = function(_card = oCard, _targetEnemy = true) {
		
	}
	
	static update = function(_card = oCard, _targetEnemy = true) {
		
	}
}