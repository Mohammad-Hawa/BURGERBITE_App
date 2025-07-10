import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/sheared_widgets/app_bar.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBarCustom(onTap: () {}),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          start: size.width / 15,
          top: size.width / 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.notifications, color: AppColors.orangeColor),
                SizedBox(
                  width: size.width / 25,
                ),
                CustomText(
                  text: 'Notifications',
                  styleType: TextStyleType.SUBTITLE,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: size.width / 15, bottom: size.width / 15),
              child: Row(
                children: [
                  Icon(Icons.security, color: AppColors.orangeColor),
                  SizedBox(
                    width: size.width / 25,
                  ),
                  CustomText(
                    text: 'Security',
                    styleType: TextStyleType.SUBTITLE,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(Icons.search, color: AppColors.orangeColor),
                SizedBox(
                  width: size.width / 25,
                ),
                CustomText(
                  text: 'Research history',
                  styleType: TextStyleType.SUBTITLE,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: size.width / 15, bottom: size.width / 15),
              child: Row(
                children: [
                  Icon(Icons.key, color: AppColors.orangeColor),
                  SizedBox(
                    width: size.width / 25,
                  ),
                  CustomText(
                    text: 'Login informations',
                    styleType: TextStyleType.SUBTITLE,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(Icons.computer, color: AppColors.orangeColor),
                SizedBox(
                  width: size.width / 25,
                ),
                CustomText(
                  text: 'Website',
                  styleType: TextStyleType.SUBTITLE,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: size.width / 15, bottom: size.width / 15),
              child: Row(
                children: [
                  Icon(Icons.help, color: AppColors.orangeColor),
                  SizedBox(
                    width: size.width / 25,
                  ),
                  CustomText(
                    text: 'Help',
                    styleType: TextStyleType.SUBTITLE,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(Icons.info_outline, color: AppColors.orangeColor),
                SizedBox(
                  width: size.width / 25,
                ),
                CustomText(
                  text: 'Help',
                  styleType: TextStyleType.SUBTITLE,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: size.width / 15),
              child: CustomText(
                text: 'Logout',
                styleType: TextStyleType.SUBTITLE,
                fontWeight: FontWeight.normal,
                textColor: AppColors.orangeColor,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
