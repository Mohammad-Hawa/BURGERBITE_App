import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';

enum TextStyleType {
  TITLE,
  SUBTITLE,
  BODY,
  SMALL,
  CUSTOM,
}

class CustomText extends StatelessWidget {
  final String text;
  final TextStyleType? styleType;
  final Color? textColor;
  final int? maxLine;
  final FontWeight? fontWeight;
  final TextAlign? textalign;
  final double? fontSize;

  const CustomText({
    super.key,
    required this.text,
    this.styleType = TextStyleType.BODY,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.maxLine,
    this.textalign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getStyle(),
      textAlign: textalign,
      overflow: TextOverflow.clip,
      maxLines: maxLine,
    );
  }

  TextStyle getStyle() {
    TextStyle result = TextStyle();

    switch (styleType) {
      case TextStyleType.TITLE:
        result = TextStyle(
          fontSize:fontSize?? screenWidth(17),
          fontWeight: fontWeight ?? FontWeight.bold,
          color: textColor,
        );
        break;
      case TextStyleType.SUBTITLE:
        result = TextStyle(
          fontSize:fontSize?? screenWidth(20),
          fontWeight: fontWeight,
          color: textColor,
        );
        break;
      case TextStyleType.BODY:
        result = TextStyle(
          fontSize:fontSize?? screenWidth(28),
          fontWeight: fontWeight,
          color: textColor,
        );
        break;
      case TextStyleType.SMALL:
        result = TextStyle(
          fontSize:fontSize?? screenWidth(30) ,
          fontWeight: fontWeight,
          color: textColor,
        );
        break;
      case TextStyleType.CUSTOM:
        result = TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
        break;

      default:
        result = TextStyle(
            fontSize: fontSize??screenWidth(28),
            fontWeight: FontWeight.normal,
            color: textColor);
        break;
    }

    return result;
  }
}
