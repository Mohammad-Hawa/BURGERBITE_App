import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:pinput/pinput.dart';

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({super.key});


  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      defaultPinTheme: PinTheme(
        width: screenWidth(9),
        height: screenHeight(24),
        textStyle: TextStyle(fontSize: screenWidth(15), color: Colors.orange),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.orange, width: 2),
          ),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: screenWidth(9),
        height: screenHeight(24),
        textStyle:
            TextStyle(fontSize: screenWidth(15), color: AppColors.orangeColor),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.orangeColor, width: 2),
          ),
        ),
      ),
    );
  }
}
