import 'dart:math';

import 'svg_renderer.dart';
import 'point_transform.dart';

class Graphics {
  final SvgRenderer renderer;
  PointTransform transform = PointTransform(0.0, 0.0, 0.0, 0.0);

  Graphics(this.renderer);

  void addPolygon(List<Point> points, [bool invert = false]) {
    var _transform = transform;
    var transformedPoints = List<Point>();
    var i = invert ? points.length - 1 : 0;
    if (!invert) {
      for (var x = i; x < points.length; x++) {
        transformedPoints.add(_transform.transform(points[x].x, points[x].y));
      }
    } else {
      for (var x = i; x >= 0; x--) {
        transformedPoints.add(_transform.transform(points[x].x, points[x].y));
      }
    }
    renderer.addPolygon(transformedPoints);
  }

  void addCircle(double x, double y, double size, [bool invert = false]) {
    var p = transform.transform(x, y, size, size);
    renderer.addCircle(p, size, invert);
  }

  void addRectangle(double x, double y, double w, double h,
      [bool invert = false]) {
    addPolygon(
      <Point>[
        Point(x, y),
        Point(x + w, y),
        Point(x + w, y + h),
        Point(x, y + h),
      ],
      invert,
    );
  }

  void addTriangle(double x, double y, double w, double h, double r,
      [bool invert = false]) {
    var points = <Point>[
      Point(x + w, y),
      Point(x + w, y + h),
      Point(x, y + h),
      Point(x, y),
    ];
    points.removeAt(r.floor().toInt() % 4);
    addPolygon(points, invert);
  }

  void addRhombus(double x, double y, double w, double h,
      [bool invert = false]) {
    addPolygon(<Point>[
      Point(x + w / 2.0, y),
      Point(x + w, y + h / 2.0),
      Point(x + w / 2.0, y + h),
      Point(x, y + h / 2.0),
    ], invert);
  }
}
