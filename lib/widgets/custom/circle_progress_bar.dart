import 'dart:math';

import 'package:flutter/material.dart';

// 参考
// https://www.jianshu.com/p/d19a046dd1bf
// https://github.com/yumi0629/FlutterUI/blob/master/lib/circleprogressbar/circle_progress_bar.dart
class CircleProgressBar extends CustomPainter {
  /// 背景色
  final Color? backgroundColor;

  /// 圆环宽度
  final double? strokeWidth;

  /// 进度百分比
  final double? progress;

  /// 圆环渐变
  final List<Color>? colors;
  CircleProgressBar({
    this.backgroundColor,
    this.strokeWidth,
    this.progress,
    this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 假定是圆环进度条
    // TODO 异形进度条
    assert(size.width == size.height);

    // 进度值要么为空, 要么在 0 ~ 1 之间
    assert(progress == null || (progress! >= 0 && progress! <= 1));

    final Paint paint = Paint()
      ..color = backgroundColor ?? const Color.fromRGBO(250, 250, 250, 1)
      ..strokeWidth = strokeWidth ?? 5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;

    final Offset center = Offset(radius, radius);

    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    // 绘制背景
    canvas.drawCircle(center, radius, paint);

    const double statAngle = 0;
    final double endAngle = (progress ?? 0.5) * 2 * pi;

    // 移动并旋转画布
    canvas.translate(0, radius * 2);
    canvas.rotate(-pi / 2);

    paint.shader = SweepGradient(
      // 从顶部开始渐变
      colors: colors ??
          [
            const Color.fromRGBO(2, 201, 182, 1),
            const Color.fromRGBO(37, 227, 153, 1),
          ],
    ).createShader(rect);
    // 绘制进度条
    canvas.drawArc(rect, statAngle, endAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
