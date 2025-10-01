import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Reusable 4-digit OTP input widget extracted from OTP enter screen
class OTPInputWidget extends StatefulWidget {
  final Function(String)? onComplete;
  final Function(String)? onChanged;
  final int length;
  final double boxSize;
  final double spacing;
  final bool enabled;

  const OTPInputWidget({
    super.key,
    this.onComplete,
    this.onChanged,
    this.length = 4,
    this.boxSize = 55,
    this.spacing = 15,
    this.enabled = true,
  });

  @override
  State<OTPInputWidget> createState() => _OTPInputWidgetState();
}

class _OTPInputWidgetState extends State<OTPInputWidget> {
  late List<TextEditingController> _otpControllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _otpControllers = List.generate(widget.length, (index) => TextEditingController());
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  String get otpValue {
    return _otpControllers.map((controller) => controller.text).join();
  }

  void clear() {
    for (var controller in _otpControllers) {
      controller.clear();
    }
    if (_focusNodes.isNotEmpty) {
      _focusNodes[0].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.length, (index) => 
        Container(
          margin: EdgeInsets.only(right: index < widget.length - 1 ? widget.spacing : 0),
          width: widget.boxSize,
          height: widget.boxSize,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(0, 0, 0, 1), width: 1),
            borderRadius: BorderRadius.zero,
          ),
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (RawKeyEvent event) {
              if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace) {
                if (_otpControllers[index].text.isEmpty && index > 0) {
                  _focusNodes[index - 1].requestFocus();
                  _otpControllers[index - 1].clear();
                }
              }
            },
            child: TextField(
              controller: _otpControllers[index],
              focusNode: _focusNodes[index],
              enabled: widget.enabled,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              onChanged: (value) {
                if (value.isNotEmpty && index < widget.length - 1) {
                  _focusNodes[index + 1].requestFocus();
                }
                
                // Call onChanged callback
                widget.onChanged?.call(otpValue);
                
                // Call onComplete when all digits are entered
                if (otpValue.length == widget.length) {
                  widget.onComplete?.call(otpValue);
                }
              },
              onTap: () {
                _focusNodes[index].requestFocus();
              },
            ),
          ),
        ),
      ),
    );
  }
}