import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:get/get.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final Function? onTap;
  final bool? istitle;
  final String? title;
  final bool? isback;
  const AppBarCustom(
      {super.key,
      this.onTap,
      this.istitle = false,
      this.title,
      this.isback = true});
  @override
  Size get preferredSize => Size.fromHeight(150);
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.orangeColor,
      width: screenWidth(1),
      height: screenHeight(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          isback!
              ? InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.whiteColor,
                    size: screenWidth(15),
                  ))
              : SizedBox(),
          istitle!
              ? CustomText(
                  text: title ?? '',
                  textColor: AppColors.whiteColor,
                  fontSize: screenWidth(15),
                )
              : Image.asset(
                  'assets/images/pngs/BURGERBITE2.png',
                  height: screenWidth(10),
                ),
          istitle!
              ? SizedBox()
              : InkWell(
                  onTap: () {
                    onTap!();
                  },
                  child: Image.asset(
                    'assets/images/pngs/Burger tool button.png',
                    height: screenWidth(15),
                  ),
                ),
        ],
      ),
    );
  }
}
