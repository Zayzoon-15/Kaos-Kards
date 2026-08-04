//Hands
hourHandAng = 0;
minHandAng = 0;

//Time
timeSpd = .5;
hours = global.savedGameTime.hours;
mins = global.savedGameTime.mins;
secs = global.savedGameTime.secs;

//Get Total Seconds
var _totalSecs = secs;
_totalSecs += mins mod 60;
_totalSecs += hours mod 3600;

//Total Time
totalHours = _totalSecs div 3600;
totalMins = _totalSecs div 60;
totalSecs = secs;
