///@desc Destroy Time Sources

for (var i = 0; i < array_length(timeSources); i++) {
    if time_source_exists(timeSources[i].source)
    {
        time_source_pause(timeSources[i].source);
        time_source_destroy(timeSources[i].source);
        array_delete(global.timeSources,timeSources[i].id,1);
    }
}