import 'package:flutter/material.dart';

/// Reusable header text widget extracted from OTP screens
class HeaderTextWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final FontWeight? titleFontWeight;
  final FontWeight? subtitleFontWeight;
  final Color? titleColor;
  final Color? subtitleColor;
  final String? fontFamily;
  final TextAlign textAlign;
  final double? spacing;

  const HeaderTextWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.titleFontSize,
    this.subtitleFontSize,
    this.titleFontWeight,
    this.subtitleFontWeight,
    this.titleColor,
    this.subtitleColor,
    this.fontFamily,
    this.textAlign = TextAlign.center,
    this.spacing,
  });

  /// Factory for OTP screen verification header
  factory HeaderTextWidget.verification({
    String? subtitle,
  }) {
    return HeaderTextWidget(
      title: 'Verification',
      subtitle: subtitle,
      titleFontWeight: FontWeight.bold,
      titleColor: Colors.black87,
      subtitleFontWeight: FontWeight.w500,
      subtitleColor: const Color.fromRGBO(69, 75, 96, 1.0),
      fontFamily: 'Inter',
    );
  }

  /// Factory for OTP message with phone number
  factory HeaderTextWidget.otpMessage({
    required String phoneNumber,
  }) {
    return HeaderTextWidget(
      title: 'An OTP has been sent to\n+91 $phoneNumber',
      titleFontWeight: FontWeight.w400,
      titleColor: const Color.fromRGBO(69, 75, 96, 1.0),
      fontFamily: 'Inter',
      titleFontSize: null, // Will use smaller responsive size in build method
    );
  }

  /// Factory for "Enter Mobile Number" text
  factory HeaderTextWidget.enterMobile() {
    return const HeaderTextWidget(
      title: 'Enter Mobile Number',
      titleFontWeight: FontWeight.w500,
      titleColor: Color.fromRGBO(69, 75, 96, 1.0),
      fontFamily: 'Inter',
    );
  }

  /// Factory for "Enter OTP" text
  factory HeaderTextWidget.enterOTP() {
    return const HeaderTextWidget(
      title: 'Enter OTP',
      titleFontWeight: FontWeight.w700,
      titleColor: Color.fromRGBO(69, 75, 96, 1.0),
      fontFamily: 'Inter',
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Use provided sizes or responsive defaults from your original design
    final defaultTitleSize = screenWidth * 0.073; // ~28px responsive
    final defaultSubtitleSize = screenWidth * 0.052; // ~20px responsive
    final defaultSpacing = screenHeight * 0.051;
    
    // Use smaller font for multiline text (like OTP messages)
    final actualTitleSize = titleFontSize ?? 
        (title.contains('\n') ? screenWidth * 0.042 : defaultTitleSize); // ~16px for multiline

    return Column(
      children: [
        // Title
        Text(
          title,
          style: TextStyle(
            fontSize: actualTitleSize,
            fontWeight: titleFontWeight ?? FontWeight.bold,
            color: titleColor ?? Colors.black87,
            fontFamily: fontFamily,
            height: title.contains('\n') ? 1.5 : null, // Line height for multiline
          ),
          textAlign: textAlign,
        ),
        
        // Spacing and subtitle if provided
        if (subtitle != null) ...[
          SizedBox(height: spacing ?? defaultSpacing),
          Text(
            subtitle!,
            style: TextStyle(
              fontSize: subtitleFontSize ?? defaultSubtitleSize,
              fontWeight: subtitleFontWeight ?? FontWeight.w500,
              fontFamily: fontFamily ?? 'Inter',
              color: subtitleColor ?? const Color.fromRGBO(69, 75, 96, 1.0),
            ),
            textAlign: textAlign,
          ),
        ],
      ],
    );
  }
}

/// Reusable footer text widget extracted from OTP screens
class FooterTextWidget extends StatelessWidget {
  final String normalText;
  final String boldText;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? normalWeight;
  final FontWeight? boldWeight;
  final String? fontFamily;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;

  const FooterTextWidget({
    super.key,
    this.normalText = 'Need help? Visit our ',
    this.boldText = 'help center',
    this.fontSize,
    this.textColor,
    this.normalWeight,
    this.boldWeight,
    this.fontFamily,
    this.width,
    this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Use provided dimensions or responsive defaults from your original design
    final containerWidth = width ?? screenWidth * 0.65;
    final containerHeight = height ?? screenHeight * 0.049;
    final defaultFontSize = fontSize ?? screenWidth * 0.042;
    final defaultMargin = margin ?? EdgeInsets.only(bottom: screenHeight * 0.039);

    return Container(
      width: containerWidth,
      height: containerHeight,
      margin: defaultMargin,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            fontFamily: fontFamily ?? 'Inter',
            fontWeight: normalWeight ?? FontWeight.w400,
            fontSize: defaultFontSize,
            color: textColor ?? const Color.fromRGBO(69, 75, 96, 1.0),
            height: 1.5,
          ),
          children: [
            TextSpan(text: normalText),
            TextSpan(
              text: boldText,
              style: TextStyle(
                fontFamily: fontFamily ?? 'Inter',
                fontWeight: boldWeight ?? FontWeight.w700,
                fontSize: defaultFontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}