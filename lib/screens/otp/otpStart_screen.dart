import 'package:flutter/material.dart';
import 'otpEnter_screen.dart';
import '../../widgets/otp_widgets/index.dart';

class OTPStartScreen extends StatefulWidget {
  const OTPStartScreen({super.key});

  @override
  State<OTPStartScreen> createState() => _OTPStartScreenState();
}

class _OTPStartScreenState extends State<OTPStartScreen> {
  final TextEditingController _phoneController = TextEditingController();

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
            
            // Phone number input with responsive positioning
            Positioned(
              top: MediaQuery.of(context).size.height * 0.52, // Adjusted for reduced spacing
              left: (MediaQuery.of(context).size.width - 279) / 2, // Center horizontally
              child: PhoneInputWidget(
                controller: _phoneController,
              ),
            ),
            
            // Main content
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Space for logo - responsive
                  SizedBox(height: MediaQuery.of(context).size.height * 0.35),
              
              // Title and subtitle with modular components
              HeaderTextWidget.verification(
                subtitle: 'Enter Mobile Number',
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.12),
              
              // Send OTP Button - responsive
              CustomButton.otpSend(
                onPressed: () {
                  // Navigate to OTP enter screen
                  if (_phoneController.text.length == 10) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPEnterScreen(
                          phoneNumber: _phoneController.text,
                        ),
                      ),
                    );
                  } else {
                    // Show error message if phone number is not 10 digits
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a valid 10-digit phone number'),
                      ),
                    );
                  }
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
