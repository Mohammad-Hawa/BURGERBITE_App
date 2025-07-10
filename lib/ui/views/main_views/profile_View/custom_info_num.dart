import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';

class NumInfo extends StatelessWidget {
  final String num;
  const NumInfo({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1),
      padding: EdgeInsetsDirectional.only(bottom: screenWidth(35)),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: CustomText(
        text: num,
        styleType: TextStyleType.BODY,
      ),
    );
  }
}
