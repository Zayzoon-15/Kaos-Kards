/**
	This function contains the full setup definition for your Figgy configuration.
	• All Setup-related methods MUST be called inside. Calling them ouside will throw an error.
	• Figgy calls this function automatically during initialization.
	• Do NOT rename, delete or call it yourself. Doing so will break initialization.
	• Documentation: https://glebtsereteli.github.io/Figgy/pages/api/figgy/setup
*/

function FiggySetup() {
    
	Figgy.Window("Game Info",true,FIGGY_WINDOW_DEFAULT_X,25,FIGGY_WINDOW_DEFAULT_WIDTH,680);
	   
        Figgy.Section("Rooms",false); #region
    
        Figgy.Separator("Resets");
        Figgy.Button("Reset Room",function(){room_restart()});
        Figgy.Button("Stickers",function(){transStart(room,oTransSticker)});
        Figgy.Separator("Main Game");
        Figgy.Button("Prepare",function(){room_goto(rPrepare)});
        Figgy.Button("Enemy",function(){room_goto(rEnemy)});
        Figgy.Button("Kaos",function(){room_goto(rKaos)});
        Figgy.Button("Break Room",function(){room_goto(rBreakRoom)});
        Figgy.Separator("Menus");
        Figgy.Button("Menu",function(){room_goto(rTournies)});
        Figgy.Button("Tourney Selector",function(){room_goto(rTourneySelector)});
        Figgy.Button("DeckBuilder",function(){room_goto(rDeckBuilder2)});
        Figgy.Separator("Testing");
        Figgy.Button("Test Room",function(){room_goto(rTesting)});
        Figgy.Button("Music Test Room",function(){room_goto(rTestingMusic)});
        Figgy.Button("Voice Test Room",function(){room_goto(rTestingVoice)});
        Figgy.Button("Card Test Room",function(){room_goto(rTestingCard)});
    
        #endregion
    
		Figgy.Section("Game Info",false); #region
    
        Figgy.Separator("Enemy");
	    Figgy.String("Current Enemy", "dog", function(){
            if struct_exists(enemyInfo,argument0) {
                global.currentEnemy = struct_get(enemyInfo,argument0);
                with oEnemyPhoto {sprite_index = global.currentEnemy.sprite;}
            }});
        //Figgy.Int("Enemy Frame",0,0,3,1,function(){with oEnemyPhoto {currentAnim = argument0}});
        Figgy.String("Enemy Animation","idle",function(){
            Enemy.PlayAnim(argument0);
        });
        Figgy.Button("Enemy Talk",function(){
            with oEnemyPhoto
            {
                talk();
            }
        });
    
        Figgy.Separator("Tournament");
	    Figgy.String("Current Tournament", "debut", function(){
            if struct_exists(tourneyInfo,argument0) {
                global.currentTourney = struct_get(tourneyInfo,argument0);
                global.tourneyEnemiesBeaten = 0;
                createAlertMessage("Tournament Changed");
            }
        });
	    Figgy.String("Enemies Beaten", 0, function(){
            global.tourneyEnemiesBeaten = argument0;
        });
    
        #endregion
    
        Figgy.Section("Audio",false); #region
        
        Figgy.Bool("Show Current Song",false,function(){
            oSound.showSongs = argument0;
        });
        Figgy.Button("Print Song Intros",function(){ds_debug_print(global.songIntrosPlayed,ds_type_list);});
    
        #endregion
		
		Figgy.Section("Game Stats",false); #region
        
        Figgy.Separator("Hand");
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
         
        Figgy.Separator("Combo"); 
		Figgy.Int("Player Combo",0,0,100,1,function(){global.playerComboMeter = argument0});
		Figgy.Int("Enemy Combo",0,0,100,1,function(){global.enemyComboMeter = argument0});
    
        #endregion
		
		Figgy.Section("Health Bar",false); #region
    
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
        Figgy.Button("Hurt Player",function(){hurtPlayer(irandom_range(1,5));});
        Figgy.Button("Apply Shield Player",function(){attackEffectAdd(effectInfo.shield,10,false)});
        Figgy.Button("Apply Poison Player",function(){attackEffectAdd(effectInfo.poison,10,false)});
        Figgy.Button("Apply Fire Player",function(){attackEffectAdd(effectInfo.fire,10,false)});
        
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
        Figgy.Button("Hurt Enemy",function(){hurtEnemy(irandom_range(1,5));});
        Figgy.Button("Apply Shield Enemy",function(){attackEffectAdd(effectInfo.shield,10,true)});
        Figgy.Button("Apply Poison Enemy",function(){attackEffectAdd(effectInfo.poison,10,true)});
        Figgy.Button("Apply Fire Enemy",function(){attackEffectAdd(effectInfo.fire,10,true)});
    
        #endregion
    
}
