
#region --- Change Time ---

//Second
second += 1 / timeSpd;
totalSecond += 1 / timeSpd;

//Increase Minute
if floor(second) >= 60
{
    minute ++;
    second = 0;
    totalMin ++;
}

//Increase Hour
if floor(minute) >= 60
{
    hour ++;
    minute = 0;
    totalHours ++;
}

//Increase Angle
minHandAng = lerp(minHandAng, -(totalMin * 6), .1);
hourHandAng = lerp(hourHandAng, -(totalHours + ( (totalMin/60) * 30 )), .2);

//print("HOUR", hour);
//print("MINUTE", minute);
//print("SECOND", second);

#endregion
