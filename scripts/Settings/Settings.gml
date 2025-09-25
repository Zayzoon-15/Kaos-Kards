
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
				new createSettingsButton("Resoultion",oSettingsSelection,{
					options: [
						{ text:"1280x720",
						action:function(){window_set_size(1280,720);window_center();} },
						
						{ text:"960x540",
						action:function(){window_set_size(960,540);window_center();} },
						
					],
					selection : 0
				},true),
			];
		break;
	
		case "VIDEO":
			_buttons = [
				new createSettingsButton("Fullscreen",oSettingsCheckBox, {
					condition:function(){return window_get_fullscreen()},
					action:function(_check){window_set_fullscreen(_check)}
				}),	
					
				new createSettingsButton("Test",oSettingsCheckBox),	
			];
		break;
	}
	
	//Return Buttons
	return _buttons;
	
}
