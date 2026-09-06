function CardsKaos() {
	
	static Swoop = new createCardKaos("Swoop", "Targets either the enemy or the player and causes a swarm of birds to attack", sCardSwoop);
	Swoop.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Discard = new createCardKaos("Clean Up", "Cleans the discard bin for all players", sCardDiscard);
	Discard.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Handy = new createCardKaos("Handy", "Increases everyones hand size by 1", sCardHandy, 4);
	Handy.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static High = new createCardKaos("Inflation","",sCardHigh);
	High.desc = function() {
        //Get Value
    	var _value = 1.1;
        repeat checkCardUses("Inflation","All") {
        	_value += .1;
        }
        
		//Return Full Description (MIGHT MAKE IT SO UPDATING VALUES CAN BE USED IN STRINGS)
        return $"All values are multiplied by [s][m]x {string_format(_value,0,1)}[/] for the current round[s][lg](The value increases by .1 after every use)"
	}
	High.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Swap = new createCardKaos("Swap", "Swaps both the players hands", sCardSwap);
	Swap.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Destroy = new createCardKaos("Deck Wrecker", "Destroys one random card from enemies hand", sCardDestroy);
	Destroy.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Freeze = new createCardKaos("Freezing Ace", "[aq]Freezes[/] a random slot from the enemies side making it unusable", sCardFreeze);
	Freeze.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Rps = new createCardKaos("Rock Paper Scissors", "Play rock paper scissors against the enemy", sCardRps);
	Rps.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Brawl = new createCardKaos("Retro Brawler Card", "Play smash bros bro lets smash rn bro >:D", sCardBrawl);
	Brawl.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Sticky = new createCardKaos("Sticky Hand", "Use a sticky hand to steal a card from the enemy", sCardSticky, 4);
	Sticky.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Hotdog = new createCardKaos("Hotdog!", "Compete in a hotdog eating contest with the enemy to gain [g]health", sCardHotdog);
	Hotdog.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static BrokenDefense = new createCardKaos("Broken Defense", "Gain  [m]100%[/]  of [g]max health[/] as [b]shield[/] but reduce [g]max health[/] by a random amount", sCardBrokenDefense);
	BrokenDefense.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Rerun = new createCardKaos("Rerun", "Retrigger all cards played this round again", sCardRerun);
	Rerun.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Vampire = new createCardKaos("Vampire", "Halfs all card values and applies them to the next round", sCardVampire);
	Vampire.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Sugar = new createCardKaos("Sugar Rush", "Makes all your cards [o]faster[/] by a random amount for the current round[s][lg](cards will be weaker after speeds are changed)", sCardSugar);
	Sugar.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Drunk = new createCardKaos("Drunken Sailor", "Makes all your enemies cards [b]slower[/] by a random amount for the current round[s][lg](cards will be weaker after speeds are changed)", sCardDrunk);
	Drunk.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static HpShare = new createCardKaos("Sharing Is Caring", "Both players share a health bar", sCardShare);
	HpShare.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Speedrun = new createCardKaos("Speedrun", "Halfs the timer the enemy has to play cards", sCardRerun);
	Speedrun.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Hotsauce = new createCardKaos("Hot Sauce", "All [g]healing[/] cards apply slight [o]fire damage[/] for the round", sCardHotsauce);
	Hotsauce.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Herobrine = new createCardKaos("Herobrine", "[lg]???", sCardBlank);
	Herobrine.use = function(_card = oAttackCard, _targetEnemy = false) {
		game_end();
	}
	
	
}