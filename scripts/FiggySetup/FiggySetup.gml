/**
	This function contains the full setup definition for your Figgy configuration.
	• All Setup-related methods MUST be called inside. Calling them ouside will throw an error.
	• Figgy calls this function automatically during initialization.
	• Do NOT rename, delete or call it yourself. Doing so will break initialization.
	• Documentation: https://glebtsereteli.github.io/Figgy/pages/api/figgy/setup
*/

function FiggySetup() {
			
	Figgy.Window("Game Info",true,FIGGY_WINDOW_DEFAULT_X,40,FIGGY_WINDOW_DEFAULT_WIDTH,500);
	
		Figgy.Section("Enemy Info");
	    Figgy.String("Current Enemy", "dog", function(){
            if struct_exists(enemyInfo,argument0) {
                global.currentEnemy = struct_get(enemyInfo,argument0);
                with oEnemyPhoto {sprite_index = global.currentEnemy.sprite;}
            }});
        //Figgy.Int("Enemy Frame",0,0,3,1,function(){with oEnemyPhoto {currentAnim = argument0}});
        Figgy.String("Enemy Animation","idle",function(){
            enemyPlayAnim(argument0);
        });
	
        Figgy.Section("Rooms");
        Figgy.Button("Reset Room",function(){room_restart()});
        Figgy.Button("Prepare",function(){room_goto(rPrepare)});
        Figgy.Button("Enemy",function(){room_goto(rEnemy)});
        Figgy.Button("Kaos",function(){room_goto(rKaos)});
        Figgy.Button("Test Room",function(){room_goto(rTesting)});
        Figgy.Button("Music Test Room",function(){room_goto(rTestingMusic)});
        Figgy.Button("Voice Test Room",function(){room_goto(rTestingVoice)});
        Figgy.Button("Menu",function(){transStart(rTournies,oTransSticker)});
        Figgy.Button("DeckBuilder",function(){room_goto(rDeckBuilder1)});
        Figgy.Button("Stickers",function(){transStart(room,oTransSticker)});
		
		Figgy.Section("Game Stats",false)
		Figgy.String("Discards",10,function(){
			if argument0 != ""
			{
				global.maxDiscards = real(argument0);
			}
		});
		Figgy.String("MaxHand",10,function(){
			if argument0 != ""
			{
				global.maxHandSize = real(argument0);
			}
		});
		Figgy.Separator("Cards");
		Figgy.String("Card To Give", "NONE",function(){
			global.debugCard = argument0;
		});
		Figgy.Button("Give Card",function(){
			
			if struct_exists(actionCards,global.debugCard)
			{
				var _card = struct_get_variable(actionCards,global.debugCard);
				array_insert(playerDeck,0,_card);
				
				//Give Deck Cards
				with oDeck
				{
					totalCards ++;
					cardsLeft ++;
					deck = playerDeck;	
					deckNum = 0;
				}
				
				exit;
			}
			
			if struct_exists(kaosCards,global.debugCard)
			{
				var _card = struct_get_variable(kaosCards,global.debugCard);
				array_insert(playerDeck,0,_card);
				
				//Give Deck Cards
				with oDeck
				{
					totalCards ++;
					cardsLeft ++;
					deck = playerDeck;
					deckNum = 0;
				}
				
				exit;
			}
			
			if struct_exists(diceCards,global.debugCard)
			{
				var _card = struct_get_variable(diceCards,global.debugCard);
				array_insert(playerDeck,0,_card);
				
				//Give Deck Cards
				with oDeck
				{
					totalCards ++;
					cardsLeft ++;
					deck = playerDeck;	
					deckNum = 0;
				}
				
				exit;
			}
			
			//No Cards
			show_message($"Card '{global.debugCard}' Does Not Exist");
		});
		
		Figgy.Section("Combo",false);
		Figgy.Int("Player Combo",0,0,100,1,function(){global.playerComboMeter = argument0});
		Figgy.Int("Enemy Combo",0,0,100,1,function(){global.enemyComboMeter = argument0});
		
		Figgy.Section("Health Bar",false);
        Figgy.Separator("Player");
        Figgy.Int("Player Health",100,0,100,FIGGY_INT_DEFAULT_STEP,function(){global.playerHp = argument0;});
        Figgy.String("Player Max Health",100,function(){
			if argument0 != "" and real(argument0) > global.playerMaxHp
			{
				global.playerMaxHp = real(argument0);
			}
		});
		Figgy.Bool("Killable Player", true,function(){global.debugKillable.player = argument0});
        Figgy.Button("Heal Player",function(){healPlayer(10)});
        Figgy.Button("Hurt Effect",function(){hurtPlayer(0);});
        Figgy.Button("Apply Shield Player",function(){addEffect(attackEffects.shield,10,false)});
        Figgy.Button("Apply Poison Player",function(){addEffect(attackEffects.poison,10,false)});
        Figgy.Button("Apply Fire Player",function(){addEffect(attackEffects.fire,10,false)});
        
        Figgy.Separator("Enemy");
        Figgy.Int("Enemy Health",100,0,100,FIGGY_INT_DEFAULT_STEP,function(){global.enemyHp = argument0;});
        Figgy.String("Enemy Max Health",100,function(){
			if argument0 != "" and real(argument0) > global.enemyMaxHp
			{
				global.enemyMaxHp = real(argument0);
			}
		});
		Figgy.Bool("Killable Enemy", true,function(){global.debugKillable.enemy = argument0});
        Figgy.Button("Heal Enemy",function(){healEnemy(10)});
        Figgy.Button("Hurt Effect",function(){hurtEnemy(0);});
        Figgy.Button("Apply Shield Enemy",function(){addEffect(attackEffects.shield,10,true)});
        Figgy.Button("Apply Poison Enemy",function(){addEffect(attackEffects.poison,10,true)});
        Figgy.Button("Apply Fire Enemy",function(){addEffect(attackEffects.fire,10,true)});
		
		Figgy.Section("Kaos Effects",false);
		Figgy.Button("Freeze Slots",function(){
			global.disabledSlots.player[1] = true;
			global.disabledSlots.enemy[1] = true;
		});
    
    
}
