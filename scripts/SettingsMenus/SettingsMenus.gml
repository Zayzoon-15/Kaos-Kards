function SettingsMenus()
{
    
    static Audio = function()
    {
        //Create Buttons
        SettingsButtons.Slider("Master","masterVol");
        SettingsButtons.Slider("Music","musicVol");
        SettingsButtons.Slider("SFX","sfxVol");
        SettingsButtons.Slider("Announcer","voiceVol",2,0,100,undefined,"%",function()
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
        
        SettingsButtons.Seperator("Type Shit Fr");
            SettingsButtons.Button("Hell Yea");
    }
    
    
    static Video = function()
    {
        //Create Buttons
        if !global.mobile
        {
            SettingsButtons.Seperator("Window");
                SettingsButtons.Options("Resolution",settingsGetWindowRes(),"currentRes",function(){
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
        
        SettingsButtons.Seperator("Graphics");
            SettingsButtons.Options("Particle Amount",[
                {text : "Full",action:function(){global.partAmount = 1;}}, 
                {text : "Meduim",action:function(){global.partAmount = .5;}}, 
                {text : "Low",action:function(){global.partAmount = .2;}}, 
                {text : "None",action:function(){global.partAmount = 0;}}, 
            ],"partSelection");
            SettingsButtons.Button("Other Suff Idk");
        
        SettingsButtons.Seperator("Subtitles");
            SettingsButtons.Check("Subtitles",function()
            {
                global.subtitles = argument0;
            },global.subtitles);
            SettingsButtons.Slider("Bg Alpha");
            SettingsButtons.Slider("Outline Thickness",undefined,1.6,0,10,ceil,"");
        
    }
    
    
    static Game = function()
    {
        //Create Buttons
        SettingsButtons.Seperator("User Interface");
            SettingsButtons.Slider("Tip Box Size",undefined,2,1,5,ceil,"X");
            SettingsButtons.Check("Tip Boxes");
        
        SettingsButtons.Seperator("Gameplay");
            SettingsButtons.Slider("Game Speed",undefined,2,1,10,ceil,"X");
            SettingsButtons.Button("What Do I Put Here...");
        
    }
    
    
    static Input = function()
    {
        //Create Buttons
        if !global.mobile
        {
            SettingsButtons.Seperator("Nothing Works Rn ToT");
                SettingsButtons.Button("Discard");
                SettingsButtons.Button("Fullscreen");
                SettingsButtons.Button("Pause");
                SettingsButtons.Button("Debug Mode");
            
            SettingsButtons.Seperator("Gamepad (Maybe)");
                SettingsButtons.Check("Gamepad");
                SettingsButtons.Button("Accept");
                SettingsButtons.Button("Discard");
        } else { //Mobile Input
            SettingsButtons.Check("Double Tap For Buttons");
            SettingsButtons.Slider("Haptic Feedback",undefined,1.8,0,10,ceil,"X");
        }
        
    }
    
}