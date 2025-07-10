import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final Function onTap;
  final bool? isselected;
  final IconData? icon;
  const NavItem({
    super.key,
    required this.onTap,
    this.isselected = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: Icon(icon, ),
    );
  }
}
