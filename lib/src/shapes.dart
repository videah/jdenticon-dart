import 'dart:math';

import 'graphics.dart';

class Shapes {
  // Center
  static Graphics _shape1(Graphics g, double cell, [double index = 0.0]) {
    var k = cell * 0.42;
    g.addPolygon([
      Point(0.0, 0.0),
      Point(cell, 0.0),
      Point(cell, cell - k * 2.0),
      Point(cell - k, cell),
      Point(0.0, cell),
    ]);
    return g;
  }

  static Graphics _shape2(Graphics g, double cell, [double index = 0.0]) {
    var w = (cell * 0.5).floor().toDouble();
    var h = (cell * 0.8).floor().toDouble();
    g.addTriangle(cell - w, 0.0, w, h, 2.0);
    return g;
  }

  static Graphics _shape3(Graphics g, double cell, [double index = 0.0]) {
    var s = (cell / 3.0).floor().toDouble();
    g.addRectangle(s, s, cell - s, cell - s);
    return g;
  }

  static Graphics _shape4(Graphics g, double cell, [double index = 0.0]) {
    var inner = cell * 0.1;
    inner = inner > 1.0 ? inner.floor().toDouble() : inner > 0.5 ? 1.0 : inner;
    var outer =
        cell < 6.0 ? 1.0 : cell < 8.0 ? 2.0 : (cell * 0.25).floor().toDouble();
    g.addRectangle(outer, outer, cell - inner - outer, cell - inner - outer);
    return g;
  }

  static Graphics _shape5(Graphics g, double cell, [double index = 0.0]) {
    var m = (cell * 0.15).floor().toDouble();
    var s = (cell * 0.5).floor().toDouble();
    g.addCircle(cell - s - m, cell - s - m, s);
    return g;
  }

  static Graphics _shape6(Graphics g, double cell, [double index = 0.0]) {
    var inner = cell * 0.1;
    var outer = inner * 4.0;
    g.addRectangle(0.0, 0.0, cell, cell);
    g.addPolygon([
      Point(outer, outer),
      Point(cell - inner, outer),
      Point(outer + (cell - outer - inner) / 2.0, cell - inner),
    ], true);
    return g;
  }

  static Graphics _shape7(Graphics g, double cell, [double index = 0.0]) {
    g.addPolygon(
      [
        Point(0.0, 0.0),
        Point(cell, 0.0),
        Point(cell, cell * 0.7),
        Point(cell * 0.4, cell * 0.4),
        Point(cell * 0.7, cell),
        Point(0.0, cell),
      ],
    );
    return g;
  }

  static Graphics _shape8(Graphics g, double cell, [double index = 0.0]) {
    g.addTriangle(cell / 2.0, cell / 2.0, cell / 2.0, cell / 2.0, 3.0);
    return g;
  }

  static Graphics _shape9(Graphics g, double cell, [double index = 0.0]) {
    g.addRectangle(0.0, 0.0, cell, cell / 2.0);
    g.addRectangle(0.0, cell / 2.0, cell / 2.0, cell / 2.0);
    g.addTriangle(cell / 2.0, cell / 2.0, cell / 2.0, cell / 2.0, 1.0);
    return g;
  }

  static Graphics _shape10(Graphics g, double cell, [double index = 0.0]) {
    var inner = cell * 0.14;
    inner = cell < 8.0 ? inner : inner.floor().toDouble();
    var outer =
        cell < 4.0 ? 1.0 : cell < 6.0 ? 2.0 : (cell * 0.35).floor().toDouble();
    g.addRectangle(0.0, 0.0, cell, cell);
    g.addRectangle(
        outer, outer, cell - outer - inner, cell - outer - inner, true);
    return g;
  }

  static Graphics _shape11(Graphics g, double cell, [double index = 0.0]) {
    var inner = cell * 0.12;
    var outer = inner * 3.0;
    g.addRectangle(0.0, 0.0, cell, cell);
    g.addCircle(outer, outer, cell - inner - outer, true);
    return g;
  }

  static Graphics _shape12(Graphics g, double cell, [double index = 0.0]) {
    g.addTriangle(cell / 2.0, cell / 2.0, cell / 2.0, cell / 2.0, 3.0);
    return g;
  }

  static Graphics _shape13(Graphics g, double cell, [double index = 0.0]) {
    var m = cell * 0.25;
    g.addRectangle(0.0, 0.0, cell, cell);
    g.addRhombus(m, m, cell - m, cell - m, true);
    return g;
  }

  static Graphics _shape14(Graphics g, double cell, [double index = 0.0]) {
    var m = cell * 0.4;
    var s = cell * 1.2;
    if (index == null || index == 0) {
      g.addCircle(m, m, s);
    }
    return g;
  }

  // Outer
  static Graphics _shape15(Graphics g, double cell, [double index = 0.0]) {
    g.addTriangle(0.0, 0.0, cell, cell, 0.0);
    return g;
  }

  static Graphics _shape16(Graphics g, double cell, [double index = 0.0]) {
    g.addTriangle(0.0, cell / 2.0, cell, cell / 2.0, 0.0);
    return g;
  }

  static Graphics _shape17(Graphics g, double cell, [double index = 0.0]) {
    g.addRhombus(0.0, 0.0, cell, cell);
    return g;
  }

  static Graphics _shape18(Graphics g, double cell, [double index = 0.0]) {
    var m = cell / 6.0;
    g.addCircle(m, m, cell - 2 * m);
    return g;
  }

  static List center = [
    (Graphics g, double cell, [double index = 0.0]) => _shape1(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape2(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape3(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape4(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape5(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape6(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape7(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape8(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape9(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape10(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape11(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape12(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape13(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape14(g, cell, index),
  ];

  static List outer = [
    (Graphics g, double cell, [double index = 0.0]) => _shape15(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape16(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape17(g, cell, index),
    (Graphics g, double cell, [double index = 0.0]) => _shape18(g, cell, index),
  ];
}
