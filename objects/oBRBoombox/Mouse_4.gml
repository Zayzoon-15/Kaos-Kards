
//angleVel += 5 * choose(-1,1);
//yVel -= 8;


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


audioPlaySong(curSong[0]);

