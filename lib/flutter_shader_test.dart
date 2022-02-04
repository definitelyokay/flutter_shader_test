import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shader_test/shader_painter.dart';
import 'package:timer_builder/timer_builder.dart';

/// Wrapper around the [ShaderPainter]. Nothing fancy here.
class FlutterShaderTest extends StatefulWidget {
  const FlutterShaderTest({Key? key, required this.fragmentProgram})
      : super(key: key);

  final FragmentProgram fragmentProgram;

  @override
  State<FlutterShaderTest> createState() => _FlutterShaderTestState();
}

class _FlutterShaderTestState extends State<FlutterShaderTest> {
  double _time = 0.0;

  static const double width = 400;
  static const double height = 400;

  @override
  Widget build(BuildContext context) {
    // Turn it into a shader with given inputs (floatUniforms).
    return TimerBuilder.periodic(
      const Duration(milliseconds: 10),
      builder: (context) {
        _time += 0.02;
        final shader = widget.fragmentProgram.shader(
          floatUniforms: Float32List.fromList(
            <double>[
              _time,
              width,
              height,
            ],
          ),
        );
        return CustomPaint(
          painter: ShaderPainter(
            shader,
            width: width,
            height: height,
          ),
        );
      },
    );
  }
}
