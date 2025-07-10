import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomPument extends StatelessWidget {
  final String image;
  final String cardnum;
  final cardholder;
  final String cvv;
  final String expdarte;
  final bool ischeck;
  final Function(bool?)? onchang;
  const CustomPument(
      {super.key,
      required this.image,
      required this.cardnum,
      this.cardholder,
      required this.cvv,
      required this.expdarte,
      required this.ischeck,
      this.onchang});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
          start: screenWidth(15), end: screenWidth(25)),
      width: screenWidth(2),
      height: screenHeight(2.5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            spreadRadius: 0.1,
            blurRadius: 5,
            offset: Offset(5, 5), // changes position of shadow
          ),
        ],
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(end: screenWidth(15)),
                child: SvgPicture.asset(
                  image,
                  height: screenHeight(8),
                ),
              ),
              Checkbox(
                  value: ischeck,
                  activeColor: AppColors.orangeColor,
                  onChanged: (b) {
                    onchang!(b);
                  }),
            ],
          ),
          CustomText(
            text: 'Card number',
            styleType: TextStyleType.CUSTOM,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: screenWidth(20)),
            child: CustomText(
              text: cardnum,
              styleType: TextStyleType.SUBTITLE,
            ),
          ),
          CustomText(
            text: 'Card holder',
            styleType: TextStyleType.CUSTOM,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: screenWidth(20)),
            child: CustomText(
              text: cardholder,
              styleType: TextStyleType.SUBTITLE,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(end: screenWidth(15)),
                child: CustomText(
                  text: 'Expiration date',
                  styleType: TextStyleType.BODY,
                ),
              ),
              CustomText(
                text: 'CVV',
                styleType: TextStyleType.BODY,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: screenWidth(20)),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(end: screenWidth(6)),
                  child: CustomText(
                    styleType: TextStyleType.SUBTITLE,
                    text: expdarte,
                  ),
                ),
                CustomText(
                  text: cvv,
                  styleType: TextStyleType.SUBTITLE,
                ),
              ],
            ),
          )
        ],
      ),
    );
    ;
  }
}
