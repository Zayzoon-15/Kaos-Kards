
///@desc Creates a new settings button
///@arg {string} _text The text on the button
///@arg {Asset.GMObject} _type The type of button it is (Ex: oSettingsCheckBox)
///@arg {bool} _takeRow If the option should take the entire row
function createSettingsButton(_text,_type,_takeRow = false) constructor 
{
    text = _text;
    type = _type;
	takeRow = _takeRow
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
				new createSettingsButton("Sounds",oSettingsCheckBox),
				new createSettingsButton("A",oSettingsCheckBox),
				new createSettingsButton("Gato",oSettingsGato,true),	
				new createSettingsButton("Gato",oSettingsGato,true),	
				new createSettingsButton("Gato",oSettingsGato),	
				new createSettingsButton("Gato",oSettingsGato),	
				new createSettingsButton("Gato",oSettingsGato),	
				new createSettingsButton("Gato",oSettingsGato),	
			];
		break;
	
		case "VIDEO":
			_buttons = [
				new createSettingsButton("Fullscreen",oSettingsCheckBox),		
				new createSettingsButton("Test",oSettingsCheckBox),	
			];
		break;
	}
	
	//Return Buttons
	return _buttons;
	
}