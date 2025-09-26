

///@desc Creates a new settings button
///@arg {string} _text The text on the button
///@arg {Asset.GMObject} _type The type of button it is (Ex: oSettingsCheckBox)
///@arg {struct} _objectInfo The type of button it is (Ex: oSettingsCheckBox)
///@arg {bool} _takeRow If the option should take the entire row
function createSettingsButton(_text,_type,_objectInfo = {},_takeRow = false) constructor 
{
    text = _text;
    type = _type;
	objectInfo = _objectInfo;
	takeRow = _takeRow;
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
				new createSettingsButton("Mute When Inactive",oSettingsCheckBox,{
					condition:function(){return global.muteAudio},
					action:function(_check){global.muteAudio =_check;},
				},true),
				new createSettingsButton("Gato",oSettingsGato,{},true),
			];
		break;
	
		case "VIDEO":
			_buttons = [
				new createSettingsButton("Resoultion",oSettingsSelection,{
					
					options: settingsButtonWindowRes(),
					selection : global.currentRes,
					reverse : true,
					disabled : function(){return !window_get_fullscreen() and !global.mobile;}
				}),
				
				new createSettingsButton("Particle Amount",oSettingsSelection,{
					
					options: [
						{text:"Full",action:function(){global.partAmount=1}},
						{text:"Medium",action:function(){global.partAmount=.5}},
						{text:"Low",action:function(){global.partAmount=.2}},
						{text:"None",action:function(){global.partAmount=0}},
					],
					selection: settingsButtonParticle()
				}),
				
				new createSettingsButton("Borderless",oSettingsCheckBox, {
					condition:function(){return !window_get_showborder()},
					action:function(_check){window_set_showborder(!_check)},
					disabled : function(){return !global.mobile;}
				}),	
				
				new createSettingsButton("Fullscreen",oSettingsCheckBox, {
					condition:function(){return window_get_fullscreen()},
					action:function(_check){window_set_fullscreen(_check)},
					disabled : function(){return !global.mobile;}
				}),	
				
				new createSettingsButton("Gato",oSettingsGato,{},true),
					
			];
		break;
	}
	
	//Return Buttons
	return _buttons;
	
}
