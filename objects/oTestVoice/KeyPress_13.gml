typing = false;

//Get Song
var _voiceLine = struct_get(voiceInfo,currentText);

//Line Does Not Exist
if !struct_exists(voiceInfo,currentText)
{
    show_message($"Song Group '{currentText}' Does Not Exist");
    exit;
}

//Play Voice Line
audioPlayVoice(_voiceLine);