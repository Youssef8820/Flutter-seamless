import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

class WaveContainer extends StatelessWidget {
  const WaveContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: math.pi, // 180 degrees in radians
      child: ClipPath(
        clipper: MyClipper(),
        child: Container(
          height: 37.h,
          width: double.infinity,
          color: AppTheme.secondary900,
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.8); // Start from the bottom left
    path.quadraticBezierTo(size.width * 0.25, size.height, size.width * 0.5, size.height * 0.8); // Wave peak
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.6, size.width, size.height * 0.8); // End point
    path.lineTo(size.width, 0); // End point
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}



