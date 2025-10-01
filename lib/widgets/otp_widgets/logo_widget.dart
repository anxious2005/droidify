import 'package:flutter/material.dart';

/// Reusable logo widget extracted from OTP screens
class LogoWidget extends StatelessWidget {
  final double? topPosition;
  final double? leftPosition;
  final double? size;
  final String? logoPath;

  const LogoWidget({
    super.key,
    this.topPosition,
    this.leftPosition,
    this.size,
    this.logoPath = 'lib/assets/logo.png',
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Use provided values or default responsive values from your original design
    final top = topPosition ?? screenHeight * 0.11;
    final left = leftPosition ?? screenWidth * 0.25;
    final logoSize = size ?? screenWidth * 0.45;

    return Positioned(
      top: top,
      left: left,
      child: Opacity(
        opacity: 1.0,
        child: Transform.rotate(
          angle: 0,
          child: Image.asset(
            logoPath!,
            height: logoSize,
            width: logoSize,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}