import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/views/main_views/cart_view/cart_View.dart';
import 'package:flutter_application_1/ui/views/main_views/favorites_view/favorits_view.dart';
import 'package:flutter_application_1/ui/views/main_views/menu._view/menue_view.dart';
import 'package:flutter_application_1/ui/views/main_views/profile_View/Profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MenueView(),
    CartView(), // صفحة السلة placeholder
    FavoritsView(), // هنا نعرض المفضلة
    ProfileView(), // صفحة البروفايل placeholder
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
