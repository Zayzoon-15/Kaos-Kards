var _vidData = video_draw();
var _vidStatus = _vidData[0];
if _vidStatus == 0
{
    draw_surface_stretched(_vidData[1], x, y, 640, 360);
}