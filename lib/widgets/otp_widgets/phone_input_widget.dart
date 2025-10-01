import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Reusable phone input widget with +91 prefix extracted from OTP start screen
class PhoneInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Function(String)? onChanged;
  final bool enabled;
  final double? width;
  final double? height;
  final String countryCode;

  const PhoneInputWidget({
    super.key,
    required this.controller,
    this.hintText = 'XXXXXXXXXX',
    this.onChanged,
    this.enabled = true,
    this.width = 279,
    this.height = 53,
    this.countryCode = '+91',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Fixed country code prefix
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              child: Text(
                countryCode,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            // Separator
            Container(
              width: 1,
              height: 30,
              color: Colors.grey.shade300,
            ),
            // Phone number input
            Expanded(
              child: TextField(
                controller: controller,
                enabled: enabled,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(10, 10, 10, 0.61),
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 15,
                  ),
                ),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}