function drawCard3d(_x, _y, _front, _back, _angle, _thickness)
{
    //Sprite Values
    var _w = sprite_get_width(_front);
    var _h = sprite_get_height(_front);

    //Horizontal Scale Based On Angle
    var _scaleX = cos(degtorad(_angle));
    var _halfW = _w / 2;
    var _halfH = _h / 2;

    //Set Sprite
    var _spriteToDraw = (_scaleX >= 0) ? _front : _back;

    //Positiongs
    var _x0 = _x - _halfW * _scaleX;
    var _y0 = _y - _halfH;
    var _x1 = _x + _halfW * _scaleX;
    var _y1 = _y - _halfH;
    var _x2 = _x + _halfW * _scaleX;
    var _y2 = _y + _halfH;
    var _x3 = _x - _halfW * _scaleX;
    var _y3 = _y + _halfH;

    //Draw Main Card
    draw_sprite_pos(_spriteToDraw, 0, _x0, _y0, _x1, _y1, _x2, _y2, _x3, _y3, 1);

    //Edge Thickness
    var _edgeFactor = 1 - abs(_scaleX);

    if _edgeFactor > 0.01
    {
        var _edgeColor = make_color_rgb(180, 180, 180);
        var _slices = _thickness;

        //Check Which Edge Faces The Screen
        var _normalizedAngle = (_angle % 360 + 360) % 360; // 0..360
        var _showRightEdge = (_normalizedAngle < 180);

        //Draw Right Edge
        if _showRightEdge
        {
            for (var _i = 0; _i < _slices; _i++)
            {
                var _offset = _i * _edgeFactor * (_thickness / _slices);
                draw_sprite_part_ext(_spriteToDraw, 0,
                    _w - 1, 0, 1, _h,
                    _x + _halfW * _scaleX + _offset, _y - _halfH,
                    1, 1, _edgeColor, 1);
            }
        } else { // Draw Left Edge
            for (var _i = 0; _i < _slices; _i++)
            {
                var _offset = _i * _edgeFactor * (_thickness / _slices);
                draw_sprite_part_ext(_spriteToDraw, 0,
                    0, 0, 1, _h,
                    _x - _halfW * _scaleX - _offset, _y - _halfH,
                    1, 1, _edgeColor, 1);
            }
        }
    }
}

