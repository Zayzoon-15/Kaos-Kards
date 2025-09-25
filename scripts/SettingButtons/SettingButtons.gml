

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
				new createSettingsButton("Farts",oSettingsSelection,{
					options: [
						{ text:"Gassy",
						action:function(){print("GAS")} },
						
						{ text:"Wet",
						action:function(){print("Wet")} },
					],
					selection : 0
				},true),
			];
		break;
	
		case "VIDEO":
			_buttons = [
				new createSettingsButton("Resoultion",oSettingsSelection,{
					
					options: settingsGetWindowRes(),
					selection : global.currentRes,
					reverse : true
				},false),
				
				new createSettingsButton("Borderless",oSettingsCheckBox, {
					condition:function(){return !window_get_showborder()},
					action:function(_check){window_set_showborder(!_check)}
				}),	
				
				new createSettingsButton("Fullscreen",oSettingsCheckBox, {
					condition:function(){return window_get_fullscreen()},
					action:function(_check){window_set_fullscreen(_check)}
				}),	
					
			];
		break;
	}
	
	//Return Buttons
	return _buttons;
	
}
