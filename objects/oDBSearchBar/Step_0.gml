//Set Focused
if touchingMouse() and mouse_check_button_pressed(mb_left)
{
    keyboard_string = text;
    focused = true;
}

if (mouse_check_button_pressed(mb_left) and !touchingMouse()) or keyboard_check_pressed(vk_enter)
{
    focused = false;
}


//Set Text
if focused
{
    lastText = text;
    text = keyboard_string;
    
    //Max Characters
    if string_width(text) > (bbox_right-10) - (bbox_left+50)
    {
        
        keyboard_string = string_delete(text,string_length(text),1);
        text = keyboard_string;
    }
    
    //Change Cards
    if lastText != text
    {
        oDBContainer.searchText = text;
        oDBContainer.createCards();
    }
}