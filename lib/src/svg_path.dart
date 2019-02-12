import 'dart:math';

class SvgPath {
  String dataString = "";

  void addPolygon(List<Point> points) {
    var draftString = "M${points[0].x} ${points[0].y}";

    for (var i = 0; i < points.length; i++) {
      draftString += "L${points[i].x} ${points[i].y}";
    }
    dataString += "${draftString}Z";
  }

  void addCircle(Point point, double diameter, bool counterClockwise) {
    var sweepFlag = counterClockwise != null ? 0 : 1;
    var svgRadius = diameter / 2.0;
    var svgDiameter = diameter;

    dataString += "M${point.x} ${point.y + diameter / 2.0}"
        "a$svgRadius,$svgRadius 0 1,$sweepFlag $svgDiameter,0"
        "a$svgRadius,$svgRadius 0 1,$sweepFlag ${-svgDiameter},0";
  }
}
