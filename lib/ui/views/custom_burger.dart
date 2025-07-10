import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_application_1/ui/shared/utils.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:like_button/like_button.dart';

class CustomBurger extends StatelessWidget {
  final String name;
  final String image;
  final Function(bool)? isliketap;
  final bool? islike;
  const CustomBurger(
      {super.key,
      required this.name,
      required this.image,
      this.islike,
      this.isliketap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsetsDirectional.only(
              start: screenWidth(15), end: screenWidth(15)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Image.asset(
              fit: BoxFit.cover,
              width: screenWidth(1.1),
              height: screenHeight(2),
              image,
            ),
          ),
        ),
        Positioned(
          top: screenWidth(15),
          left: screenWidth(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  textColor: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  text: name,
                  styleType: TextStyleType.SUBTITLE),
              Container(
                  margin: EdgeInsetsDirectional.only(start: screenWidth(25)),
                  alignment: Alignment.center,
                  width: screenWidth(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.orangeColor),
                  child: CustomText(
                    text: '16.50 \$',
                    textColor: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: screenWidth(25),
                  top: screenWidth(1.5),
                ),
                child: Container(
                    alignment: Alignment.center,
                    width: screenWidth(3.5),
                    height: screenWidth(12.8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.orangeColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.whiteColor,
                          size: screenWidth(15),
                        ),
                        CustomText(
                          fontSize: screenWidth(25),
                          text: 'Add to cart',
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.whiteColor,
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          top: screenWidth(18),
          right: screenWidth(8),
          child: LikeButton(
            isLiked: islike, // ✅ ربط الحالة
            onTap: (isLiked) async {
              if (isliketap != null) {
                return await isliketap!(isLiked);
              }
              return !isLiked;
            },
            likeBuilder: (bool isLiked) {
              return Icon(
                size: screenWidth(10),
                isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                color: isLiked ? AppColors.orangeColor : AppColors.greycolor,
              );
            },
          ),
        ),
      ],
    );
  }
}
