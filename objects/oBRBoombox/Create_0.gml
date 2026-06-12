//Inherit
event_inherited();

//Songs
songs = [
    ["BreakRoomIntro", 0], //Defualt Song
    ["Boombox1", 101], 
    ["Boombox2", 101], 
    
    
]
curSong = songs[0];
lastSong = curSong;

//Animation
curvePos = 0;
angDir = 1;

//Info
tipBoxString = "Boombox";
tipBoxOffset = new Vector2(20,0);

action = function()
{
    if curSong == songs[0]
    {
        //Change Song
        curSong = lastSong;
        while lastSong == curSong
        {
            curSong = songs[irandom_range(1,array_length(songs)-1)];
        }
        
        lastSong = curSong;
        
    } else {
        curSong = songs[0];
        TweenEasyMove(x,y,x,ystart,0,30,EaseOutBounce);
        TweenEasyRotate(image_angle,0,0,30,EaseOutBack);
    }
    
    if curSong == songs[0]
    {
        audioPlaySong(curSong[0]);
    } else audioPlaySong(curSong[0],30,"Pause");
    
}