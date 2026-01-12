/// @desc The buttons for the settings menu
function SettingsButtons()
{
    ///@desc Creates A Separator
    ///@param {string} _text The title of the seperator
    ///@param {real} _textScale The text scale (Default = 2)
    static Separator = function(_text = "Nothing",_textScale = 2)
    {
        //Create Basic Button
        instance_create_depth(0,0,oSettingsSubMenu.depth-1,oSettingsSeparator,{
            btnId : global.settingsBtnId,
            text : _text,
            textTargetScale : _textScale,
        });
        
        //Increase Button Id
        global.settingsBtnId ++;
    }
    
    ///@desc Creates A Basic Button
    ///@param {string} _text The button name
    ///@param {function} _action The button action
    ///@param {function} _disabled The function to check if the button is disabled (can be a bool to)
    ///@param {string} _reason The reason for why the button is disabled
    ///@param {real} _textScale The text scale (Default = 2)
    static Button = function(_text = "Empty",_action = function(){},_disabled = undefined,_reason = "No Reason",_textScale = 2)
    {
        //Create Basic Button
        instance_create_depth(0,0,oSettingsSubMenu.depth-1,oParSettingsBtn,{
            btnId : global.settingsBtnId,
            text : _text,
            textTargetScale : _textScale,
            disableCheck : _disabled,
            reason : _reason,
            btnAction : _action,
        });
        
        //Increase Button Id
        global.settingsBtnId ++;
    }
    
    ///@desc Creates A Check Box Button
    ///@param {string} _text The button name
    ///@param {function} _action The button action (argument0 is if the button is checked or not)
    ///@param {function} _checked The function to check if the button is checked (can be a bool to)
    ///@param {function} _disabled The function to check if the button is disabled (can be a bool to)
    ///@param {string} _reason The reason for why the button is disabled
    ///@param {real} _textScale The text scale (Default = 2)
    static Check = function(_text = "Check",_action = function(_checked){},_checked = undefined,_disabled = undefined,_reason = "No Reason",_textScale = 2)
    {
        //Create Basic Button
        instance_create_depth(0,0,oSettingsSubMenu.depth-1,oSettingsCheck,{
            btnId : global.settingsBtnId,
            text : _text,
            textTargetScale : _textScale,
            disableCheck : _disabled,
            reason : _reason,
            btnAction : _action,
            checkedFunc : _checked
        });
        
        //Increase Button Id
        global.settingsBtnId ++;
    }
    
    ///@desc Creates A Slider
    ///@param {string} _text The name of the slider
    ///@param {string} _changeVar The target global variable
    ///@param {function} _onChange This function is called everytime the slider is changed leave undefined if the slider uses a global var
    ///@param {real} _textScale The text scale (Default = 2)
    ///@param {real} _min The minimum the slider can go
    ///@param {real} _max The max the slider can go
    ///@param {bool} _roundText If the text shown should be rounded
    ///@param {function} _roundFunc The rounding method the value should use (Ex: ceil, floor, round)
    ///@param {string} _textIcon The icon to put after the value (Ex: % = 100%)
    ///@param {function} _disabled The function to check if the button is disabled (can be a bool to)
    ///@param {string} _reason The reason for why the button is disabled
    static Slider = function(_text = "Slider",_changeVar = undefined,_onChange = undefined,_textScale = 2,_min = 0,_max = 100,_roundText = true,_roundFunc = undefined,_textIcon = "%",_disabled = undefined,_reason = "No Reason")
    {
        //Create Slider
        instance_create_depth(0,0,oSettingsSubMenu.depth-1,oSettingsSlider,{
            btnId : global.settingsBtnId,
            text : _text,
            textTargetScale : _textScale,
            changeVar : _changeVar,
            disableCheck : _disabled,
            reason : _reason,
            slideMin : _min,
            slideMax : _max,
            roundFunc : _roundFunc,
            textIcon : _textIcon,
            onChange : _onChange,
            roundText : _roundText
        });
        
        //Increase Button Id
        global.settingsBtnId ++;
    }
    
    ///@desc Creates An Options Button
    ///@param {string} _text The name of the slider
    ///@param {array<struct>} _choices The choices for the button Ex: [{text:"Option1",action:function(){}},{text:"Option2",action:function(){}}]
    ///@param {any*} _curOption The current option (if u put in a string it will check for a global var and change the global var)
    ///@param {bool} _flipChoices If the choices should be flipped (Default = false)
    ///@param {function} _disabled The function to check if the button is disabled (can be a bool to)
    ///@param {string} _reason The reason for why the button is disabled
    ///@param {real} _textScale The text scale (Default = 2)
    static Options = function(_text = "Options",_choices=[{text:"Option1",action:function(){}},{text:"Option2",action:function(){}}],_curOption = undefined,_flipChoices = false,_disabled = undefined,_reason = "No Reason",_textScale = 2)
    {
        //Create Basic Button
        instance_create_depth(0,0,oSettingsSubMenu.depth-1,oSettingsOptions,{
            btnId : global.settingsBtnId,
            text : _text,
            disableCheck : _disabled,
            reason : _reason,
            textTargetScale : _textScale,
            choices : _choices,
            targetOption : _curOption,
            flipChoices : _flipChoices
        });
        
        //Increase Button Id
        global.settingsBtnId ++;
    }
 
    ///@desc Creates an input button
    ///@param {string} _text The button name
    ///@param {string} _targetVar The target global variable that contains the input key
    ///@param {function} _disabled The function to check if the button is disabled (can be a bool to)
    ///@param {string} _reason The reason for why the button is disabled
    ///@param {real} _textScale The text scale (Default = 2)
    static Input = function(_text = "Empty",_targetVar = undefined,_disabled = undefined,_reason = "No Reason",_textScale = 2)
    {
        //Create Basic Button
        instance_create_depth(0,0,oSettingsSubMenu.depth-1,oSettingsInput,{
            btnId : global.settingsBtnId,
            text : _text,
            textTargetScale : _textScale,
            disableCheck : _disabled,
            reason : _reason,
            targetKey : _targetVar
        });
        
        //Increase Button Id
        global.settingsBtnId ++;
    }   
}
