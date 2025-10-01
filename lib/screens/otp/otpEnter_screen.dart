import 'package:flutter/material.dart';
import '../../widgets/common/index.dart';

class OTPEnterScreen extends StatefulWidget {
  final String phoneNumber;
  
  const OTPEnterScreen({super.key, required this.phoneNumber});

  @override
  State<OTPEnterScreen> createState() => _OTPEnterScreenState();
}

class _OTPEnterScreenState extends State<OTPEnterScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            child: Stack(
              children: [
            // Logo with responsive positioning
            const LogoWidget(),
            
            // OTP input boxes with responsive positioning
            Positioned(
              top: MediaQuery.of(context).size.height * 0.62, // ~480px responsive
              left: (MediaQuery.of(context).size.width - (55 * 4 + 15 * 3)) / 2, // Center horizontally
              child: OTPInputWidget(
                onComplete: (otp) {
                  // Handle OTP completion - same logic as original
                  if (otp.length == 4) {
                    print('OTP entered: $otp');
                  }
                },
              ),
            ),
            
            // Main content
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Space for logo - responsive
                  SizedBox(height: MediaQuery.of(context).size.height * 0.35),
              
              // Title with modular components
              HeaderTextWidget.verification(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.051),
              
              // OTP sent message with modular component
              Container(
                width: MediaQuery.of(context).size.width * 0.62, // ~235px responsive
                child: HeaderTextWidget.otpMessage(
                  phoneNumber: widget.phoneNumber,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.026),
              
              // Enter OTP text with modular component
              HeaderTextWidget.enterOTP(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.039),
              
              SizedBox(height: MediaQuery.of(context).size.height * 0.065),
              
              // Submit Button - responsive
              CustomButton.otpSubmit(
                onPressed: () {
                  // Handle OTP submission - keep original logic
                  // Note: This will need to be updated to work with modular OTP input
                  print('Submit button pressed');
                },
              ),
              
              const Spacer(),
              
              // Footer text - responsive
              const FooterTextWidget(),
                ],
              ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
