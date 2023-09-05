import 'package:flutter/material.dart';

enum LineDirection { horizontal, vertical }

@immutable
class DashedLine extends StatelessWidget {
  final double dashWidth;
  final double dashHeight;
  final double dashGap;
  final Color dashColor;
  final LineDirection direction;
  final Widget child;
  const DashedLine(
      {this.dashWidth = 5,
      this.dashHeight = 1,
      this.dashGap = 5,
      this.dashColor = Colors.grey,
      this.direction = LineDirection.horizontal,
      required this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: DashedLinePainter(
            dashWidth: dashWidth,
            dashHeight: dashHeight,
            dashGap: dashGap,
            dashColor: dashColor,
            direction: direction),
        child: child);
  }
}

@immutable
class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashHeight;
  final double dashGap;
  final Color dashColor;
  final LineDirection direction;

  const DashedLinePainter(
      {required this.dashWidth,
      required this.dashHeight,
      required this.dashGap,
      required this.dashColor,
      required this.direction});

  @override
  void paint(Canvas canvas, Size size) {
    double start = 0;

    final paint = Paint()
      ..color = dashColor
      ..strokeWidth = dashHeight;

    if (direction == LineDirection.horizontal) {
      while (start < size.width) {
        canvas.drawLine(Offset(start, 0), Offset(start + dashWidth, 0), paint);
        start += dashWidth + dashGap;
      }
    } else if (direction == LineDirection.vertical) {
      while (start < size.height) {
        canvas.drawLine(Offset(0, start), Offset(0, start + dashHeight), paint);
        start += dashHeight + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
