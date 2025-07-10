import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/views/main_views/main_view_widgets/nav_item.dart';

enum BottomNavBar {
  MENU,
  FAVORITE,
  PROFILE,
  CART,
}

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius:
              BorderRadiusDirectional.vertical(top: Radius.circular(25))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        NavItem(onTap: () {}, icon: Icons.restaurant),
        NavItem(onTap: () {}, icon: Icons.shopping_cart_outlined),
        NavItem(onTap: () {}, icon: Icons.favorite_border),
        NavItem(onTap: () {}, icon: Icons.person_outline_sharp),
      ]),
    );
  }
}
