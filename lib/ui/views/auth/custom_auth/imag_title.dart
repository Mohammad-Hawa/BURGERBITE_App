import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';

class ImageTitle extends StatelessWidget {
  final String? title1;
  final String? title2;
  final double? width;
  const ImageTitle({super.key, this.title1, this.title2, this.width = 10});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('assets/images/pngs/LOGO2.png', height: screenHeight(6)),
        RichText(
          textAlign: TextAlign.center, // يجعل النص كله بالوسط
          text: TextSpan(
            children: [
              TextSpan(
                style: TextStyle(
                    fontSize: screenWidth(width!),
                    color: AppColors.orangeColor),
                text: '${title1 ?? ''}\n', // \n يعني انتقل للسطر الجديد
              ),
              TextSpan(
                style: TextStyle(
                    fontSize: screenWidth(15), color: AppColors.orangeColor),
                text: title2,
              ),
            ],
          ),
        )

        // CustomText(
        //   textalign: TextAlign.center,
        //   text: '$title1\n $title2',
        //   styleType: TextStyleType.TITLE,
        //   textColor: AppColors.orangeColor,
        // ),
      ],
    );
  }
}
