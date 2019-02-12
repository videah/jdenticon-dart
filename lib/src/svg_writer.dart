class SvgWriter {
  final int size;
  var _s;

  SvgWriter(this.size) {
    _s = "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\""
        "$size\" height=\"$size\" viewBox=\"0 0 $size $size \" preserveAspectRatio=\"xMidYMid meet\">";
  }

  void setBackground(String fillColor, double opacity) {}

  void append(String color, String dataString) {
    _s += "<path fill=\"$color\" d=\"$dataString\"/>";
  }

  @override
  String toString() {
    return "$_s</svg>";
  }
}
