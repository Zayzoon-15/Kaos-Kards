typing = false;

//Get Song
var _asset = asset_get_index($"sg{currentText}");

//Group Does Not Exist
if groupSong
{
    if !struct_exists(global.musicGroups,currentTextGroup)
    {
        show_message($"Song Group '{currentTextGroup}' Does Not Exist")
        exit;
    }
}

if _asset
{
    if groupSong
    {
        audioPlayGroupSong(struct_get_variable(global.musicGroups,currentTextGroup),_asset);
    } else audioPlaySong(_asset);
    
} else show_message($"Song 'sg{currentText}' Does Not Exist");