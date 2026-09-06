function CardsDice() {
	
	static Reroll = new createCardDice("Reroll", "Reroll all the [aq]dice[s][lg](Can ONLY be placed after roll)", sCardReroll);
	Reroll.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Upgrade = new createCardDice("Dice Upgrade", "Adds a random amount to a random [aq]dice[/] roll", sCardUpgrade, true, [1, 6]);
	Upgrade.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static AllNothin = new createCardDice("All or Nothin'", "If all [aq]dice[/] roll [o]higher[/] than half of their maximum value, set all [aq]dice[/] to their maximum value. Otherwise, set all [aq]dice[/] to 0[s][lg](Can ONLY be placed before roll)", sCardAllNothin);
	AllNothin.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	///Dice Changes
	static Dice8 = new createCardDice("8 Sided Dice", "Changes one random [aq]dice[/] to an 8 sided [aq]dice[s][lg](Can ONLY be placed before roll)", sCardDice8, true, undefined, 9);
	Dice8.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Dice12 = new createCardDice("12 Sided Dice", "Changes one random [aq]dice[/] to a 12 sided [aq]dice[s][lg](Can ONLY be placed before roll)", sCardDice12, true, undefined, 6);
	Dice12.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
	static Dice20 = new createCardDice("20 Sided Dice", "Changes one random [aq]dice[/] to a 20 sided [aq]dice[s][lg](Can ONLY be placed before roll)", sCardDice20, true, undefined, 4);
	Dice20.use = function(_card = oAttackCard, _targetEnemy = false) {
		
	}
	
}