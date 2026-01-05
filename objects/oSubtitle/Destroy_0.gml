///@desc Destroy Time Sources

for (var i = 0; i < array_length(timeSources); i++) {
    if time_source_exists(timeSources[i])
    {
        time_source_pause(timeSources[i]);
        time_source_destroy(timeSources[i]);
    }
}