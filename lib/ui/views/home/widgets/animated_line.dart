import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedLines extends StatefulWidget {
  const AnimatedLines({super.key});

  @override
  State<AnimatedLines> createState() => _AnimatedLinesState();
}

class _AnimatedLinesState extends State<AnimatedLines>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: WavyLinePainter(_controller.value),
          );
        },
      ),
    );
  }
}

class WavyLinePainter extends CustomPainter {
  final double progress;

  WavyLinePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final redPaint = Paint()
      ..color = const Color(0xFFD06776)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final bluePaint = Paint()
      ..color = const Color(0xFF6FBAFC)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path1 = Path();
    final path2 = Path();

    for (double x = 0; x < size.width; x++) {
      double shift = progress * 2 * pi;
      path1.lineTo(
        x,
        100 + 20 * sin((x * 0.02) + shift),
      );
      path2.lineTo(
        x,
        150 + 30 * cos((x * 0.015) + shift),
      );
    }

    canvas.drawPath(path1, redPaint);
    canvas.drawPath(path2, bluePaint);
  }

  @override
  bool shouldRepaint(covariant WavyLinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
