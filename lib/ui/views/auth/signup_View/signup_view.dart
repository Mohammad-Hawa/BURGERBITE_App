import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/custom_Button.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:flutter_application_1/ui/views/auth/custom_auth/Qu_row.dart';
import 'package:flutter_application_1/ui/views/auth/custom_auth/custom_textfield.dart';
import 'package:flutter_application_1/ui/views/auth/custom_auth/imag_title.dart';
import 'package:flutter_application_1/ui/views/auth/login_view/login_view.dart';
import 'package:flutter_application_1/ui/views/auth/signup2_view/signup2_view.dart';
import 'package:flutter_svg/svg.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarCustom(
        istitle: true,
        title: 'SIGN UP',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: screenWidth(25)),
            child: ImageTitle(title1: 'Welcome', title2: 'Sign up to continue'),
          ),
          CustomTextFormfield(
            hinttext: 'Surname',
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: screenWidth(15), bottom: screenWidth(15)),
            child: CustomTextFormfield(
              hinttext: 'First name',
            ),
          ),
          CustomButton(
            text: 'Continue',
            bordereadius: 25,
            ontap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SignupView2();
                },
              ));
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: screenWidth(20), bottom: screenWidth(20)),
            child: CustomText(text: 'Or log in with'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/svgs/Icon simple-facebook.svg'),
              SizedBox(
                width: screenWidth(15),
              ),
              SvgPicture.asset('assets/images/svgs/Icon simple-google.svg'),
            ],
          ),
          Spacer(),
          QueRow(
              subtitle: ' Log in ',
              ontap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginView();
                  },
                ));
              },
              title: 'Don’t have an account'),
        ],
      ),
    ));
  }
}
