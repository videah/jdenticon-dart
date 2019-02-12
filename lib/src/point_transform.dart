import 'dart:math';

class PointTransform {
  final double _x;
  final double _y;
  final double _size;
  final double _rotation;

  PointTransform(this._x, this._y, this._size, this._rotation);

  Point transform(double x, double y, [double w, double h]) {
    var right = _x + _size;
    var bottom = _y + _size;
    var height = h != null ? h : 0.0;
    var width = w != null ? w : 0.0;
    return _rotation == 1.0
        ? Point(right - y - height, _y + x)
        : _rotation == 2.0
            ? Point(right - x - width, bottom - y - height)
            : _rotation == 3.0
                ? Point(_x + y, bottom - x - width)
                : Point(_x + x, _y + y);
  }
}
