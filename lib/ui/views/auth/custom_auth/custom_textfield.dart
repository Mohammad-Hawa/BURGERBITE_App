import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';

class CustomTextFormfield extends StatelessWidget {
  final String hinttext;
  final IconData? suficon;
  const CustomTextFormfield({super.key, required this.hinttext, this.suficon});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: screenWidth(1.4),
      height: screenHeight(15),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            spreadRadius: 0.1,
            blurRadius: 5,
            offset: Offset(5, 5), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: screenWidth(15), end: screenWidth(15)),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hinttext,
            suffixIcon: suficon != null ? Icon(suficon) : SizedBox(),
            // focusedBorder:
            //     OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            // enabledBorder:
            //     OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          ),
        ),
      ),
    );
  }
}
