

function sineWave(_time, _period, _amplitude, _midpoint) {
    return sin(_time * 2 * pi / _period) * _amplitude + _midpoint;
}

function sineBetween(_time, _period, _minimum, _maximum) {
    var _midpoint = mean(_minimum, _maximum);
    var _amplitude = _minimum - _midpoint;
    return sineWave(_time, _period, _amplitude, _midpoint);
}