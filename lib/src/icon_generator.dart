import 'color.dart';
import 'config.dart';
import 'graphics.dart';
import 'point_transform.dart';
import 'shapes.dart';
import 'svg_renderer.dart';

class IconGenerator {
  final SvgRenderer renderer;
  final String hash;
  final double x;
  final double y;
  final double size;
  final double padding;
  final Config config;
  Graphics graphics;

  var _padding;
  var _size;
  var cell;
  var _x;
  var _y;
  var hue;
  List<int> selectedColorIndexes;
  var availableColors;
  var index;

  IconGenerator(this.renderer, this.hash, this.x, this.y, this.size,
      [this.padding = 0.0, this.config]) {
    _padding = 0;
    _size = size - _padding * 2.0;

    graphics = Graphics(renderer);

    cell = (_size / 4.0);

    _x = x + (_padding + _size / 2.0 - cell * 2.0).floor();
    _y = y + (_padding + _size / 2.0 - cell * 2.0).floor();

    hue = int.parse(hash.substring(hash.length - 7), radix: 16).toDouble() /
        0xfffffff;

    availableColors = colorTheme(hue, config);
    selectedColorIndexes = List<int>();
    index = 0;

    for (var i = 0; i < 3; i++) {
      index = int.parse(hash.substring(i + 8, i + 9).toString(), radix: 16) %
          availableColors.length;
      if (isDuplicate([0, 4]) || isDuplicate([2, 3])) index = 1;
      selectedColorIndexes.add(index);
    }

    renderShape(0, Shapes.outer, 2, 3, [
      [1, 0],
      [2, 0],
      [2, 3],
      [1, 3],
      [0, 1],
      [3, 1],
      [3, 2],
      [0, 2]
    ]);

    renderShape(1, Shapes.outer, 4, 5, [
      [0, 0],
      [3, 0],
      [3, 3],
      [0, 3],
    ]);
    renderShape(2, Shapes.center, 1, null, [
      [1, 1],
      [2, 1],
      [2, 2],
      [1, 2],
    ]);

    graphics.renderer.finish();
  }

  void renderShape(int colorIndex, List shapes, int index, int rotationIndex,
      List positions) {
    var r = rotationIndex != null
        ? int.parse(hash.substring(index, index + 2).toString(), radix: 16)
        : 0;
    var shape =
    shapes[int.parse(hash.substring(index, index + 1).toString(), radix: 16) % shapes.length];

    graphics.renderer
        .beginShape(availableColors[selectedColorIndexes[colorIndex]]);
    for (var i = 0; i < positions.length; i++) {
      graphics.transform = PointTransform(_x + positions[i][0] * cell,
          _y + positions[i][1] * cell, cell, ((r++ % 4.0).toDouble()));
      graphics = shape(graphics, cell, i.toDouble());
    }
    graphics.renderer.endShape();
  }

  bool isDuplicate(List<int> values) {
    if (values.indexOf(index) >= 0) {
      for (var i = 0; i < values.length; i++) {
        if (selectedColorIndexes.indexOf(values[i]) >= 0) {
          return true;
        }
      }
    }
    return false;
  }
}

List<String> colorTheme(double hue, Config config) {
  return [
    Color.hsl(0.0, 0.0, config.grayscaleLightness(0.0)),
    Color.correctedHsl(hue, config.saturation, config.colorLightness(0.5)),
    Color.hsl(0.0, 0.0, config.grayscaleLightness(1.0)),
    Color.correctedHsl(hue, config.saturation, config.colorLightness(1.0)),
    Color.correctedHsl(hue, config.saturation, config.colorLightness(0.0)),
  ];
}
