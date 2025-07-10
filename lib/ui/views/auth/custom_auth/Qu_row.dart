import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';

class QueRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function ontap;
  const QueRow({super.key, required this.title, required this.subtitle, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: size.width / 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: '$title?',
            styleType: TextStyleType.SUBTITLE,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(
            width: size.width / 55,
          ),
          InkWell(
            onTap: () {
              ontap();
            },
            child: CustomText(
              text: subtitle,
              styleType: TextStyleType.SUBTITLE,
              fontWeight: FontWeight.normal,
              textColor: AppColors.orangeColor,
            ),
          )
        ],
      ),
    );
  }
}
