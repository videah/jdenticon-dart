import 'dart:math';

class Color {
  static String decToHex(int v) {
    var capped = min(max(v, 0), 255);
    return capped.toRadixString(16);
  }

  static String hueToRgb(double m1, double m2, double h) {
    var h2 = h < 0 ? h + 6 : h > 6 ? h - 6 : h;
    return decToHex((255 *
            (h2 < 1
                ? m1 + (m2 - m1) * h2
                : h2 < 3 ? m2 : h2 < 4 ? m1 + (m2 - m1) * (4 - h2) : m1))
        .floor());
  }

  static String rgb(int r, int g, int b) {
    return "#${decToHex(r)}${decToHex(g)}${decToHex(b)}";
  }

  static String parse(String color) {
    var re = RegExp("^#[0-9a-f]{3,8}\$");
    if (re.hasMatch(color)) {
      var r = color[1];
      var g = color[2];
      var b = color[3];
      var a = color.length > 4 ? color[4] : "";
      return "#$r$r$g$g$b$b$a$a";
    }
    return "#000000";
  }

  static String toCss3(String hexColor) {
    var a = 1;
    try {
      var a = int.parse(hexColor.substring(7, 2), radix: 16);
    } catch (e) {
      return hexColor;
    }
    var r = int.parse(hexColor.substring(1, 2), radix: 16);
    var g = int.parse(hexColor.substring(3, 2), radix: 16);
    var b = int.parse(hexColor.substring(5, 2), radix: 16);
    return "rgba($r,$g,$b,${a / 255.0})";
  }

  static String hsl(double h, double s, double l) {
    if (s == 0.0) {
      var partialHex = decToHex((l * 255.0).floor());
      return "#$partialHex$partialHex$partialHex";
    } else {
      var m2 = l <= 0.5 ? l * (s + 1) : l + s - l * s;
      var m1 = l * 2 - m2;
      return "#${hueToRgb(m1, m2, (h * 6.0 + 2.0))}"
          "${hueToRgb(m1, m2, (h * 6.0))}"
          "${hueToRgb(m1, m2, (h * 6.0 - 2.0))}";
    }
  }

  static String correctedHsl(double h, double s, double l) {
    var correctors = [0.55, 0.5, 0.5, 0.46, 0.6, 0.55, 0.55];
    var corrector = correctors[(h * 6 + 0.5).floor()];
    var l2 = l < 0.5
        ? l * corrector * 2.0
        : corrector + (l - 0.5) * (1.0 - corrector) * 2.0;
    return Color.hsl(h, s, l2);
  }
}
