import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/auth/virfi_view/virfi_view.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhonnumView extends StatefulWidget {
  const PhonnumView({super.key});
  @override
  State<PhonnumView> createState() => _PhonnumViewState();
}

class _PhonnumViewState extends State<PhonnumView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarCustom(
          istitle: true,
          title: 'SIGN UP',
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.only(
            top: screenWidth(15),
            start: screenWidth(15),
            end: screenWidth(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Set phone', styleType: TextStyleType.TITLE),
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: screenWidth(20)),
                child: CustomText(
                  text: 'Number',
                  styleType: TextStyleType.TITLE,
                  textColor: AppColors.orangeColor,
                ),
              ),
              CustomText(
                  text: 'Region',
                  styleType: TextStyleType.SUBTITLE,
                  textColor: AppColors.orangeColor),
              IntlPhoneField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange), // عند التركيز
                  ),
                  labelText: 'Phone Number',
                ),
                initialCountryCode: 'SY',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: screenWidth(20)),
                child: CustomText(
                    text: 'Phone number',
                    styleType: TextStyleType.SUBTITLE,
                    textColor: AppColors.orangeColor),
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange), // عند التركيز
                  ),
                  hintText: '0987-874-384',
                  enabledBorder: UnderlineInputBorder(),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: screenWidth(2)),
                child: Center(
                    child: CustomButton(
                        text: 'Confirm',
                        ontap: () {
                          Get.to(VirfiView());
                        })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
