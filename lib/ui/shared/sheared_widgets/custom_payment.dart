import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';

class CustomPaymentContainer extends StatelessWidget {
  final String image;
  final Color? color;
  CustomPaymentContainer({super.key, required this.image, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(screenWidth(35)),
      height: screenHeight(12),
      width: screenWidth(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(
          color: color ?? Colors.grey,
          width: 1,
        ),
      ),
      child: Image.asset(
        image,
      ),
    );
  }
}
