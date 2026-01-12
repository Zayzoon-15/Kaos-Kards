/// @desc The settings menus
function SettingsMenus()
{
    
    static Audio = function()
    {
        //Create Buttons
        SettingsButtons.Slider("Master","masterVol");
        SettingsButtons.Slider("Music","musicVol");
        SettingsButtons.Slider("SFX","sfxVol");
        SettingsButtons.Slider("Announcer","voiceVol",undefined,2,0,100,true,undefined,"%",function()
        {
            return !global.voiceover;
        },"Announcer Voice Disabled");
        SettingsButtons.Check("Unfocus Mute",function()
        {
            global.unfocusMute = argument0;
        },global.unfocusMute);
        SettingsButtons.Check("Announcer Voice",function()
        {
            global.voiceover = argument0;
        },global.voiceover);
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
                },function(){return window_get_fullscreen();});
                SettingsButtons.Check("Borderless",function()
                {
                    window_set_showborder(!argument0);
                },function(){return !window_get_showborder();});
        }
        
        SettingsButtons.Separator("Graphics");
            SettingsButtons.Options("Particle Amount",[
                {text : "Full",action:function(){global.partAmount = 1;}}, 
                {text : "Meduim",action:function(){global.partAmount = .5;}}, 
                {text : "Low",action:function(){global.partAmount = .2;}}, 
                {text : "None",action:function(){global.partAmount = 0;}}, 
            ],"partSelection",true);
            SettingsButtons.Button("Other Suff Idk");
        
        SettingsButtons.Separator("Subtitles");
            SettingsButtons.Check("Subtitles",function()
            {
                global.subtitles = argument0;
            },global.subtitles);
            SettingsButtons.Slider("Text Scale",global.subtitlesStyle.textScale,function(){global.subtitlesStyle.textScale = argument0;},2,.5,2,false,undefined,"X",function(){
                return !global.subtitles;
            },"Subtitles Disabled");
            SettingsButtons.Slider("Box Alpha",global.subtitlesStyle.boxAlpha*100,function(){global.subtitlesStyle.boxAlpha = argument0/100;},2,0,100,true,undefined,"%",function(){
                return !global.subtitles;
            },"Subtitles Disabled");
            SettingsButtons.Slider("Outline Thickness",global.subtitlesStyle.outlineThickness,function(){global.subtitlesStyle.outlineThickness = argument0;},1.6,0,5,true,ceil,"X",function(){
                return !global.subtitles;
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
            },function(){return !global.subtitles;},"Subtitles Disabled");
        
    }
    
    
    static Game = function()
    {
        //Create Buttons
        SettingsButtons.Separator("User Interface");
            SettingsButtons.Slider("Tip Box Size",undefined,undefined,2,1,5,true,ceil,"X");
            SettingsButtons.Check("Tip Boxes");
        
        SettingsButtons.Separator("Gameplay");
            SettingsButtons.Slider("Game Speed",undefined,undefined,2,1,10,true,ceil,"X");
            SettingsButtons.Button("What Do I Put Here...",function()
            {
                instance_create_depth(ROOM_CENTER.x,ROOM_CENTER.y,-300,oJumpScare);
            });
        
    }
    
    
    static Input = function()
    {
        //Create Buttons
        if !global.mobile
        {
            SettingsButtons.Separator("Keyboard And Mouse");
                SettingsButtons.Input("Discard","keyDiscard");
                SettingsButtons.Input("Fullscreen","keyFullscreen");
                SettingsButtons.Input("Pause","keyPause");
                SettingsButtons.Input("Debug Mode","keyDebug");
            
            SettingsButtons.Separator("Gamepad (Maybe)");
                SettingsButtons.Check("Gamepad");
                SettingsButtons.Button("Accept");
                SettingsButtons.Button("Discard");
        } else { //Mobile Input
            SettingsButtons.Check("Double Tap For Buttons");
            SettingsButtons.Slider("Haptic Feedback",undefined,1.8,0,10,true,ceil,"X");
        }
        
    }
    
}