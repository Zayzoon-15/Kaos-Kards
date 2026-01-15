//Sound Is Not Playing
if !audio_is_playing(info.sound) and !audio_is_paused(info.sound)
{
    global.voicePlaying = false;
    targetAlpha = 0;
}

//Destroy
if alpha <= .2 and !audio_is_paused(info.sound)
{
    instance_destroy();
}

//Fade
alpha = lerp(alpha,targetAlpha,.2);

//Pause
if global.paused
{
    //Pause Sound
    audio_pause_sound(sound);
    
    //Pause Time Sources
    for (var i = 0; i < array_length(timeSources); i++) {
        if time_source_exists(timeSources[i])
        {
            time_source_pause(timeSources[i]);
        }
    }
    
    //Set Pause
    paused = true;
} else if paused {
    
    //Resume Sound
    audio_resume_sound(sound);
    
    //Resume Time Sources
    for (var i = 0; i < array_length(timeSources); i++) {
        if time_source_exists(timeSources[i])
        {
            time_source_resume(timeSources[i]);
        }
    }
    
    //Set Pause
    paused = false;
}