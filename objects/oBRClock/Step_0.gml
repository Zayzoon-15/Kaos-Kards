
#region --- Change Time ---

//Second
secs += 1 / timeSpd;
totalSecs += 1 / timeSpd;

//Increase Minute
if floor(secs) >= 60
{
    mins ++;
    secs = 0;
    totalMins ++;
}

//Increase Hour
if floor(mins) >= 60
{
    hours ++;
    mins = 0;
    totalHours ++;
}

//Increase Angle
minHandAng = lerp(minHandAng, -(totalMins * 6), .1);
hourHandAng = lerp(hourHandAng, -(totalHours + ( (totalMins/60) * 30 )), .2);

#endregion
