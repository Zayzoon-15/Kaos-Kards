
function SettingsButtons()
{
    ///@desc Creates A Seperator
    static Seperator = function(_text = "Nothing",_textScale = 2)
    {
        //Create Basic Button
        instance_create_depth(0,0,-5,oSettingsSeperator,{
            btnId : global.settingsBtnId,
            text : _text,
            textTargetScale : _textScale,
        });
        
        //Increase Button Id
        global.settingsBtnId ++;
    }
    
    ///@desc Creates A Basic Button
    static Button = function(_text = "Empty",_action = function(){},_disabled = undefined,_reason = "No Reason",_textScale = 2)
    {
        //Create Basic Button
        instance_create_depth(0,0,-5,oParSettingBtn,{
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
    static Check = function(_text = "Check",_action = function(_checked){},_checked = undefined,_disabled = undefined,_reason = "No Reason",_textScale = 2)
    {
        //Create Basic Button
        instance_create_depth(0,0,-5,oSettingsCheck,{
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
    ///@param {real} _textScale The text scale
    ///@param {real} _min The minimum the slider can go
    ///@param {real} _max The max the slider can go
    ///@param {function} _disabled The function to check if the button is disabled
    ///@param {string} _reason The reason for why the button is disabled
    static Slider = function(_text = "Slider",_changeVar = undefined,_textScale = 2,_min = 0,_max = 100,_disabled = undefined,_reason = "No Reason")
    {
        //Create Slider
        instance_create_depth(0,0,-5,oSettingsSlider,{
            btnId : global.settingsBtnId,
            text : _text,
            textTargetScale : _textScale,
            changeVar : _changeVar,
            disableCheck : _disabled,
            reason : _reason,
            slideMin : _min,
            slideMax : _max,
        });
        
        //Increase Button Id
        global.settingsBtnId ++;
    }
    
    ///@desc Creates An Options Button
    static Options = function(_text = "Options",_textScale = 2)
    {
        //Create Basic Button
        instance_create_depth(0,0,-5,oParSettingBtn,{
            btnId : global.settingsBtnId,
            text : _text,
            textTargetScale : _textScale,
        });
        
        //Increase Button Id
        global.settingsBtnId ++;
    }
    
}