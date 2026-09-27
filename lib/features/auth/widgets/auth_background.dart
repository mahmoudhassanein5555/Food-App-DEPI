import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, this.showBack = false, this.onBack});

  final bool showBack;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ColoredBox(color: AppColors.background),
        Positioned.fill(child: CustomPaint(painter: _AuthPatternPainter())),
        if (showBack)
          Positioned(
            left: 24,
            top: 50,
            child: GestureDetector(
              onTap: onBack,
              child: Container(
                width: 45,
                height: 45,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.chevron_left,
                  size: 25,
                  color: Color(0xFF5E616F),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _AuthPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final dashed = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = AppColors.orange.withValues(alpha: .20);

    final circle = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 94
      ..color = Colors.white.withValues(alpha: .05);

    final path = Path();
    path.moveTo(size.width + 51, -89);
    path.cubicTo(335, -58, 331, -17, 293, -4);
    path.cubicTo(282, 0, 280, 15, 289, 22);
    path.lineTo(376, 93);
    path.cubicTo(381, 97, 383, 103, 381, 109);
    path.lineTo(351, 200);
    path.cubicTo(350, 205, 351, 210, 354, 214);
    path.lineTo(469, 355);

    _drawDashedPath(canvas, path, dashed, 8, 8);
    _drawDashedCircle(canvas, const Offset(5.5, -5.5), 88.5, circle);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint, double dash, double gap) {
    for (final metric in path.computeMetrics()) {
      double d = 0;
      while (d < metric.length) {
        final end = (d + dash).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(d, end), paint);
        d += dash + gap;
      }
    }
  }

  void _drawDashedCircle(Canvas canvas, Offset center, double radius, Paint paint) {
    const count = 42;
    for (int i = 0; i < count; i += 2) {
      final a1 = i * 3.1415926535 * 2 / count;
      final a2 = (i + 1) * 3.1415926535 * 2 / count;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        a1,
        a2 - a1,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}