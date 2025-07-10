import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';

class CustomBurgerType extends StatelessWidget {
  final String name;
  final String image;
  const CustomBurgerType({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            fit: BoxFit.cover,
            width: screenWidth(4),
            height: screenHeight(10),
            image,
          ),
        ),
        CustomText(
          text: name,
          styleType: TextStyleType.BODY,
          textColor: AppColors.orangeColor,
        )
      ],
    );
  }
}
