import 'package:flutter/material.dart';

/// Reusable button widget extracted from OTP screens
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;
  final bool loading;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final BorderRadius? borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.enabled = true,
    this.loading = false,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
  });

  /// Factory for OTP Send button with your original styling
  factory CustomButton.otpSend({
    VoidCallback? onPressed,
    bool enabled = true,
    bool loading = false,
  }) {
    return CustomButton(
      text: 'Send OTP',
      onPressed: onPressed,
      enabled: enabled,
      loading: loading,
      backgroundColor: const Color.fromRGBO(178, 173, 173, 1),
      textColor: Colors.white,
      fontWeight: FontWeight.w600,
      borderRadius: BorderRadius.circular(12),
    );
  }

  /// Factory for OTP Submit button with your original styling
  factory CustomButton.otpSubmit({
    VoidCallback? onPressed,
    bool enabled = true,
    bool loading = false,
  }) {
    return CustomButton(
      text: 'Submit',
      onPressed: onPressed,
      enabled: enabled,
      loading: loading,
      backgroundColor: const Color.fromRGBO(178, 173, 173, 1),
      textColor: Colors.white,
      fontWeight: FontWeight.w600,
      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Use provided dimensions or responsive defaults from your original design
    final buttonWidth = width ?? screenWidth * 0.8;
    final buttonHeight = height ?? screenHeight * 0.05;
    final buttonFontSize = fontSize ?? screenWidth * 0.047;

    return Center(
      child: SizedBox(
        width: buttonWidth,
        height: buttonHeight,
        child: ElevatedButton(
          onPressed: (enabled && !loading) ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? const Color.fromRGBO(178, 173, 173, 1),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
            ),
            disabledBackgroundColor: Colors.grey.shade400,
          ),
          child: loading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      textColor ?? Colors.white,
                    ),
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: buttonFontSize,
                    fontWeight: fontWeight ?? FontWeight.w600,
                    color: textColor ?? Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}