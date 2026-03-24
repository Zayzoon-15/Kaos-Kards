//Manage Timers
for (var i = 0; i < array_length(global.timeSources); i++) {
    
    //Check If Exists
    if time_source_exists(global.timeSources[i]) continue;
    
    if !global.paused
    {
        //Destroy After Stopped
        if time_source_get_state(global.timeSources[i]) == time_source_state_stopped
        {
            time_source_destroy(global.timeSources[i]);
            array_delete(global.timeSources,i,1);
        }
    }
}