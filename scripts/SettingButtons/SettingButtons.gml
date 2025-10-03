

///@desc Creates a new settings button
///@arg {string} _text The text on the button
///@arg {Asset.GMObject} _type The type of button it is (Ex: oSettingsCheckBox)
///@arg {struct} _objectInfo The type of button it is (Ex: oSettingsCheckBox)
function createSettingsButton(_text,_type,_objectInfo = {}) constructor 
{
    text = _text;
    type = _type;
	objectInfo = _objectInfo;
}


///@desc Returns all setting menu buttons
function getSettingsButtons(_menu)
{
	
	//Create Buttons
	var _buttons = [];
	switch _menu
	{
		case "AUDIO":
			_buttons = [
				new createSettingsButton("Master",oSettingsSlider,{
					changeVar : "masterVol"
				}),
				new createSettingsButton("Music",oSettingsSlider,{
					changeVar : "musicVol"
				}),
				new createSettingsButton("SFX",oSettingsSlider,{
					changeVar : "sfxVol"
				}),
				new createSettingsButton("Unfocused Mute",oSettingsCheck,{
					action : function(_checked){global.unFocusMute = _checked;},
					checked : function(){return global.unFocusMute;},
				}),
			];
		break;
	
		case "VIDEO":
		if !global.mobile
		{
			_buttons = [
				new createSettingsButton("Resolution",oSettingsOptions,{
					condition : function(){return window_get_fullscreen();},
					reason : "Window Is Fullscreened",
					selectVar : "currentRes",
					options : settingsGetWindowRes()
				}),
				new createSettingsButton("Fullscreen",oSettingsCheck,{
					action : function(_checked){window_set_fullscreen(_checked);},
					checked : function(){return window_get_fullscreen();},
				}),
				new createSettingsButton("Borderless",oSettingsCheck,{
					action : function(_checked){window_set_showborder(!_checked);},
					checked : function(){return !window_get_showborder();},
				}),
				
				new createSettingsButton("Particle Amount",oSettingsOptions,
				{
					selectVar : "partSelection",
					options : [
						{
							text:"Full",
							action:function(){global.partAmount = 1;}
						},
						{
							text:"Meduim",
							action:function(){global.partAmount = .5;}
						},
						{
							text:"Low",
							action:function(){global.partAmount = .2;}
						},
						{
							text:"None",
							action:function(){global.partAmount = 0;}
						},
						
					],
				}),
			];
		} else {
			_buttons = [	
				new createSettingsButton("Particle Amount",oSettingsOptions),
				
				];
		}
		break;
	
		case "INPUT":
			if !global.mobile
			{
			_buttons = [
				new createSettingsButton("Discard",oSettingsInput,{
					key : "keyDiscard",
				}),
				new createSettingsButton("Fullscreen",oSettingsInput,{
					key : "keyFullscreen",
				}),
				new createSettingsButton("Pause",oSettingsInput,{
					key : "keyPause",
				}),
				new createSettingsButton("Debug Mode",oSettingsInput,{
					key : "keyDebug",
				}),
				new createSettingsButton("Gamepad",oSettingsCheck,{
					condition : function(){return true;},
					reason : "In Development"
				}),
			];
			} else {
			_buttons = [
				new createSettingsButton("Haptic Feedback",oParSettingsBox),
				new createSettingsButton("Double Tap For Buttons",oSettingsCheck,{
					action : function(_checked){global.unFocusMute = _checked;},
					checked : function(){return global.unFocusMute;},
				}),
			];
			}
		break;
		
		case "GAME":
			_buttons = [
				new createSettingsButton("",oParSettingsBox,{
					condition : function(){return true;},
					reason : "All Options Below Are Being Worked On"
				}),
				new createSettingsButton("Game Speed (Only Single Player)",oParSettingsBox,{
					condition : function(){return true;},
					reason : ""	
				}),
				new createSettingsButton("Tip Box Size",oParSettingsBox,{
					condition : function(){return true;},
					reason : ""	
				}),
				new createSettingsButton("Tip Boxes",oSettingsCheck,{
					condition : function(){return true;},
					reason : ""	
				},),
			];
		break;
	}
	
	//Return Buttons
	return _buttons;
	
}
