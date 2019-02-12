import 'dart:math';

import 'svg_path.dart';
import 'svg_writer.dart';

class SvgRenderer {
  var _pathsByColor = Map<String, SvgPath>();
  final SvgWriter _target;
  int size;
  SvgPath _path;

  SvgRenderer(this._target);

  void beginShape(String color) {
    if (_pathsByColor[color] == null) {
      _pathsByColor[color] = SvgPath();
    }
    _path = _pathsByColor[color];
  }

  void endShape() {}
  void addPolygon(List<Point> points) => _path.addPolygon(points);
  void addCircle(Point point, double diameter, bool counterClockwise) =>
      _path.addCircle(point, diameter, counterClockwise);

  void finish() {
    for (var color in _pathsByColor.keys) {
      _target.append(color, _pathsByColor[color].dataString);
    }
  }
}
