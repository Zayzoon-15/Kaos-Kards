 function CardsAction() {
    
	//Meme Cards
    static Gato = new createCardAction("Gato", "It's a cat", sGato, [10000000000,10000000001],-20,650,CARDACT_GENRES.ATTACK);
    static Perro = new createCardAction("Perro", "It's a dog", sPerro, [9360,9360],-20,650,CARDACT_GENRES.ATTACK);
	
	
	
	static Heal = new createCardAction("Health Pack", "Heals you depending on cards value", sCardHeal, [1,12], 30, -10, CARDACT_GENRES.HEAL);
	Heal.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Shield = new createCardAction("Shield", "Grants you temporary health that reduces after every round", sCardShield, [1,12], 30, 0, CARDACT_GENRES.DEFEND);
	Shield.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Slash = new createCardAction("Mighty Sword", "Slashes your enemy with a mighty sword", sCardSlash, [1,6], 0, 0, CARDACT_GENRES.ATTACK);
	Shield.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Bread = new createCardAction("Bread", "Shoots a 3 slices of bread at the enemy", sCardBread, [1,6], -20, 10, CARDACT_GENRES.ATTACK);
	Bread.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Laser = new createCardAction("Giant F**King Laser", "Shoots a giant f**king laser at the enemy", sCardLaser, [1,6], 20, 20, CARDACT_GENRES.ATTACK);
	Laser.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Punch = new createCardAction("Punch", "Punches your enemy in the flipping face", sCardPunch, [1,6], -20, -10, CARDACT_GENRES.ATTACK);
	Punch.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static FlaminAce = new createCardAction("Flamin' Ace", "Burns your enemy alive", sCardFlaminAce, [1,4], 20, 0, CARDACT_GENRES.ATTACK);
	FlaminAce.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Poison = new createCardAction("Poison", "Poisons your enemy for a random period of time", sCardPoison, [1,4], 0, 10, CARDACT_GENRES.ATTACK);
	Poison.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Mirror = new createCardAction("Mirror", "Reflects any [aq]physical[/] attacks attacking the card but you take some damage as well[s][lg](The range changes how much more damage the attack does)", sCardMirror, [0,2], 30, -20, CARDACT_GENRES.DEFEND);
	Mirror.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Ghost = new createCardAction("Ghost", "Shoots a [aq]non physical[/] ghost that ignores [b]shields", sCardGhost, [1,5], 0, -10, CARDACT_GENRES.ATTACK);
	Ghost.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Taunt = new createCardAction("Taunt", "Taunt your enemy to gain a random amount of [o]combo[/] charge and steal a random amount from them", sCardTaunt, [1,4], 20, -10, CARDACT_GENRES.ATTACK);
	Taunt.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Steak = new createCardAction("Juicy Steak", "Increase [g]max health[/] by cards value", sCardSteak, [0,7], 30, -10, CARDACT_GENRES.HEAL);
	Steak.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Silence = new createCardAction("Silence", "A chance to silence the the card in front of it[s][lg](The higher the value the higher the chance of silencing the card)", sCardSilence, [0,10], 30, 0, CARDACT_GENRES.DEFEND);
	Silence.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static JerryCan = new createCardAction("Jerry Can", "All [o]fire effects[/] currently active create an [r]explosion[/] and get removed", sCardBlank, [4,9], 60, 0, CARDACT_GENRES.ATTACK);
	JerryCan.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Bodyslam = new createCardAction("Body Slam", "Turn a percentage of your [b]shield[/] into [r]damage[/]", sCardShield, [35,65], 60, 20, CARDACT_GENRES.ATTACK);
	Bodyslam.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Fiary = new createCardAction("Fairy Bottle", "bottle", sCardBlank, [1,7], 0, 60, CARDACT_GENRES.DEFEND);
	Fiary.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Burger = new createCardAction("Burger", "[g]Heals[/] you a great amount but the amount it [g]heals[/] [o]decreases[/] every use[s][lg](The healing can go negative, damaging you)", sCardBurger, [10,20], 30, -10, CARDACT_GENRES.HEAL);
	Burger.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
	static Reckless = new createCardAction("Reckless Attack", "Deal high damage to the enemy, but take a small amount of recoil damage", sCardPunch, [5,9], 50, 50, CARDACT_GENRES.ATTACK);
	Reckless.use = function(_card = oAttackCard, _targetEnemy = true) {
		
	}
	
}