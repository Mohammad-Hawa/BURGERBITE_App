import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/auth/custom_auth/custom_textfield.dart';
import 'package:flutter_application_1/ui/views/auth/virfi_view/virfi_view.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(          resizeToAvoidBottomInset: false,

      appBar: AppBarCustom(
        istitle: true,
        title: 'FORGOT PASSWORD',
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: screenWidth(7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: screenWidth(8)),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: TextStyle(
                          fontSize: screenWidth(15),
                          color: AppColors.blackColor),
                      text: '${'Enter your email' ?? ''}\n',
                    ),
                    TextSpan(
                      style: TextStyle(
                          fontSize: screenWidth(15),
                          color: AppColors.orangeColor),
                      text: 'To rest your password',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: screenWidth(15)),
              child: CustomTextFormfield(
                hinttext: 'Email',
                suficon: Icons.email,
              ),
            ),
            CustomButton(
                text: 'Confirm',
                ontap: () {
                  VirfiView();
                })
          ],
        ),
      ),
    ));
  }
}
