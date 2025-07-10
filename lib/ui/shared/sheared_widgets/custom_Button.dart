import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? bordereadius;
  final Function ontap;
  const CustomButton(
      {super.key, required this.text, this.bordereadius, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        alignment: Alignment.center,
        height: screenHeight(18),
        width: screenWidth(1.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(bordereadius ?? 25),
            color: AppColors.orangeColor),
        child: CustomText(
          styleType: TextStyleType.SUBTITLE,
          text: text,
          textColor: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
