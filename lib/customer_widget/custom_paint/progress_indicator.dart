import 'dart:math';

import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  const GradientCircularProgressIndicator(
      {Key? key,
      this.stokeWidth = 5,
      this.radius = 10,
      this.strokeCapRound = false,
      this.value = 1.0,
      this.bgColor = Colors.white,
      this.totalAngle = 2 * pi,
      this.colors,
      this.stops})
      : super(key: key);

  ///粗细
  final double stokeWidth;

  ///圆的半径
  final double radius;

  ///两端是否为圆角
  final bool strokeCapRound;

  ///当前进度，取值范围[0.0 - 1.0]
  final double value;

  ///进度条背景色
  final Color bgColor;

  ///进度条的总弧度，2*PI为整圆，小于2*PI不是整圆
  final double totalAngle;

  ///渐变色的数组
  final List<Color>? colors;

  ///渐变色的终止点，对应colors
  final List<double>? stops;

  @override
  Widget build(BuildContext context) {
    double _offset = .0;
    if (strokeCapRound) {
      // _offset = asin(stokeWidth / (radius * 2 - stokeWidth));
    }
    var _colors = colors;
    if (_colors == null) {
      var color = Theme.of(context).colorScheme.secondary;
      _colors = [color, color];
    }

    return Transform.rotate(
        angle: -pi / 2.0 - _offset,
        child: CustomPaint(
          size: Size.fromRadius(radius),
          painter: _GradientCircularProgressPainter(
              strokeWidth: stokeWidth,
              strokeCapRound: strokeCapRound,
              backgroundColor: bgColor,
              radius: radius,
              total: totalAngle,
              colors: _colors,
              stops: stops,
              value: value),
        ));
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter(
      {this.strokeWidth = 10.0,
      this.strokeCapRound = false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.radius = 10,
      this.total = 2 * pi,
      required this.colors,
      this.stops,
      this.value = 1.0});

  final double strokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double>? stops;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double _offset = strokeWidth / 2;
    double _value = value;
    _value = _value.clamp(0.0, 1.0) * total;
    double _start = 0;
    if (strokeCapRound) {
      _start = asin(strokeWidth / (size.width - strokeWidth));
    }

    Rect rect = Offset(_offset, _offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;

    ///画背景
    paint.color = backgroundColor;
    canvas.drawArc(rect, _start, total, false, paint);

    ///画前景
    if (_value > 0) {
      paint.shader = SweepGradient(
              colors: colors, startAngle: 0.0, endAngle: _value, stops: stops)
          .createShader(rect);
    }

    canvas.drawArc(rect, _start, _value, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
