import 'package:flutter/material.dart';

/// Renderer used for rendering and testing our shaders.
class ShaderPainter extends CustomPainter {
  ShaderPainter(this.shader, {required this.width, required this.height})
      : _paint = Paint()..shader = shader;

  final Shader shader;

  final Paint _paint;

  final double width;
  final double height;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, width, height), _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
