import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'color.dart';
import 'config.dart';
import 'icon_generator.dart';
import 'svg_renderer.dart';
import 'svg_writer.dart';

class Jdenticon {
  static String toSvg(String hash, int size, [double padding]) {
    var writer = SvgWriter(size);
    var renderer = SvgRenderer(writer);
    IconGenerator(
      renderer,
      sha1.convert(utf8.encode("$hash")).toString(),
      0.0,
      0.0,
      size.toDouble(),
      padding,
      getCurrentConfig(),
    );
    return writer.toString();
  }

  static Config getCurrentConfig() {
    var backColor = "#FFFFFF";
    lightness(String configName, double defaultMin, double defaultMax) {
      var range = [defaultMin, defaultMax];
      return (double value) {
        var value2 = range[0] + value * (range[1] - range[0]);
        return value2 < 0 ? 0.0 : value2 > 1 ? 1.0 : value2;
      };
    }

    return Config(0.5, lightness("color", 0.4, 0.8),
        lightness("grayscale", 0.3, 0.9), Color.parse(backColor));
  }
}
