/// @desc The settings menus
function SettingsMenus()
{
    
    static Audio = function()
    {
        //Create Buttons
        SettingsButtons.Separator("Volume");
            SettingsButtons.Slider("Master","masterVol");
            SettingsButtons.Slider("Music","musicVol");
            SettingsButtons.Slider("SFX","sfxVol");
            SettingsButtons.Slider("Announcer","voiceVol",undefined,2,0,100,true,undefined,"%",function()
            {
                return global.voiceover <= 0;
            },"Announcer Voice Disabled");
            
        
        SettingsButtons.Separator("Control");
            SettingsButtons.Check("Unfocus Mute",function()
            {
                global.unfocusMute = argument0;
            },global.unfocusMute);
            SettingsButtons.Slider("Announcer Frequency","voiceover",undefined,1.5);
            SettingsButtons.Check("Enemy Dialogue Sounds");
    }
    
    
    static Video = function()
    {
        //Create Buttons
        if !global.mobile
        {
            SettingsButtons.Separator("Window");
                SettingsButtons.Options("Resolution",settingsGetWindowRes(),"currentRes",false,function(){
                    return window_get_fullscreen();
                }, "Window Is Fullscreened");
                SettingsButtons.Check("Fullscreen",function()
                {
                    window_set_fullscreen(argument0);
                    
                    //Set Correct Window
                    if window_get_showborder()
					{
						global.window = "Window";
					} else global.window = "Borderless";
                    global.window = argument0 ? "Fullscreen" : global.window;
                },function(){return window_get_fullscreen();});
                SettingsButtons.Check("Borderless",function()
                {
                    window_set_showborder(!argument0);
					if window_get_showborder()
					{
						global.window = "Window";
					} else global.window = "Borderless";
                    
                    window_center();
					
                },function(){return !window_get_showborder();});
        }
        
        SettingsButtons.Separator("Graphics");
            SettingsButtons.Options("Particle Amount",[
                {text : "Full",action:function(){global.partAmount = 1;}}, 
                {text : "Meduim",action:function(){global.partAmount = .5;}}, 
                {text : "Low",action:function(){global.partAmount = .2;}}, 
                {text : "None",action:function(){global.partAmount = 0;}}, 
            ],"partSelection",true);
			SettingsButtons.Check("V-Sync",function(){
				global.vSync = argument0;
				display_reset(0,global.vSync);
			},global.vSync);
			SettingsButtons.Check("Animated UI Elements",function(){
				global.animatedUi = argument0;
			},global.animatedUi);
        
        SettingsButtons.Separator("Subtitles");
            SettingsButtons.Check("Subtitles",function()
            {
                global.subtitles = argument0;
            },global.subtitles,function(){return global.voiceover <= 0},"Voiceover Disabled");
            SettingsButtons.Slider("Text Scale",global.subtitlesStyle.textScale,function(){global.subtitlesStyle.textScale = argument0;},2,.5,2,false,undefined,"X",function(){
                return !global.subtitles or global.voiceover <= 0;
            },"Subtitles Disabled");
            SettingsButtons.Slider("Box Alpha",global.subtitlesStyle.boxAlpha*100,function(){global.subtitlesStyle.boxAlpha = argument0/100;},2,0,100,true,undefined,"%",function(){
                return !global.subtitles or global.voiceover <= 0;
            },"Subtitles Disabled");
            SettingsButtons.Slider("Outline Thickness",global.subtitlesStyle.outlineThickness,function(){global.subtitlesStyle.outlineThickness = argument0;},1.6,0,5,true,ceil,"X",function(){
                return !global.subtitles or global.voiceover <= 0;
            },"Subtitles Disabled");
            SettingsButtons.Button("Reset Subtitles",function(){
                global.subtitlesStyle = {
                    boxAlpha : UIBOX_ALPHA,
                    outlineThickness : 3,
                    textScale : 1
                };
                
                //Reset Menu
                instance_destroy(oParSettingsBtn);
                oSettingsSubMenu.scroll = 0;
                global.settingsBtnId = 0;
                SettingsMenus.Video();
            },function(){return !global.subtitles or global.voiceover <= 0;},"Subtitles Disabled");
        
    }
    
    
    static Game = function()
    {
        //Create Buttons
        SettingsButtons.Separator("User Interface");
            SettingsButtons.Slider("Tip Box Size","tipBoxSize",undefined,2,1,3,false,roundHalf,"X");
            SettingsButtons.Check("Tip Boxes");
            SettingsButtons.Check("Show Percentage",function(){
                global.showPercentage = argument0;
            },global.showPercentage);
            SettingsButtons.Check("Show Game Version",function(){
				global.showGameVer = argument0;
			},global.showGameVer);
        
        SettingsButtons.Separator("Gameplay");
            
            SettingsButtons.Check("Explosions After Match",function(){
                global.explosionsAfter = argument0; 
            },global.explosionsAfter);
            SettingsButtons.Check("Enemy Dialogue",function()
            {
                global.enemyDialogue = argument0;
            },global.enemyDialogue);
		
            //SettingsButtons.Slider("Game Speed","gameSpeed",undefined,2,1,4,false,undefined,"X");
            SettingsButtons.Button("What Do I Put Here...",function()
            {
                instance_create_depth(ROOM_CENTER.x,ROOM_CENTER.y,-300,oJumpScare);
            });
        
        SettingsButtons.Separator("Game Save");
            SettingsButtons.Button("Delete Save File",function(){
                instance_destroy(oGame);
                file_delete("GameSave.kaos");
                game_restart();
            });
            SettingsButtons.Button("Unlock All Cards",function()
            {
                global.playerFullDeck = [];
                var _allCards = array_concat(variable_struct_get_names(actionCards),variable_struct_get_names(diceCards),variable_struct_get_names(kaosCards));
                for (var i = 0; i < array_length(_allCards); i++) {
                    
                    //Get Card
                    var _info = undefined;
                    if struct_exists(actionCards,_allCards[i]) then _info = struct_get_variable(actionCards,_allCards[i]);
                    if struct_exists(diceCards,_allCards[i]) then _info = struct_get_variable(diceCards,_allCards[i]);
                    if struct_exists(kaosCards,_allCards[i]) then _info = struct_get_variable(kaosCards,_allCards[i]);
                    
                    array_push(global.playerFullDeck,_info);
                }
                
            });
    }
    
    
    static Input = function()
    {
        //Create Buttons
        if !global.mobile
        {

            SettingsButtons.Separator("Game");
                SettingsButtons.Input("Discard","keyDiscard");
                SettingsButtons.Input("Debug Mode","keyDebug");
            
            SettingsButtons.Separator("Input");
                SettingsButtons.Input("Fullscreen","keyFullscreen");
                SettingsButtons.Input("Pause","keyPause");
                SettingsButtons.Input("Move Left","keyMoveLeft");
                SettingsButtons.Input("Move Right","keyMoveRight");
                SettingsButtons.Input("Move Up","keyMoveUp");
                SettingsButtons.Input("Move Down","keyMoveDown");

            
            SettingsButtons.Separator("Kaos Games");
                SettingsButtons.Input("Brawler Jump","keyJump");
                SettingsButtons.Input("Brawler Attack","keyAttack");
                SettingsButtons.Input("Brawler Block","keyBlock");
            
            //Removed For Now
            //SettingsButtons.Separator("Gamepad (Maybe)");
                //SettingsButtons.Check("Gamepad");
                //SettingsButtons.Button("Accept");
                //SettingsButtons.Button("Discard");
        } else { //Mobile Input
            SettingsButtons.Check("Double Tap For Buttons",function()
            {
                global.mobilePress = argument0;
            },global.mobilePress);
            SettingsButtons.Slider("Haptic Feedback",undefined,undefined,1.8,0,10,true,ceil,"X");
        }
        
    }
    
}