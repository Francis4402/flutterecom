import 'package:ecommerceflutter/presentation/screens/cart_list_screen.dart';
import 'package:ecommerceflutter/presentation/screens/category_list_screen.dart';
import 'package:ecommerceflutter/presentation/screens/home_screen.dart';
import 'package:ecommerceflutter/presentation/screens/wish_list_screen.dart';
import 'package:ecommerceflutter/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:ecommerceflutter/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavbarScreen extends StatefulWidget {
  const MainBottomNavbarScreen({super.key});

  @override
  State<MainBottomNavbarScreen> createState() => _MainBottomNavbarScreenState();
}

class _MainBottomNavbarScreenState extends State<MainBottomNavbarScreen> {
  final MainBottomNavbarController _navbarController =
      Get.find<MainBottomNavbarController>();

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavbarController>(
        builder: (_) {
          return _screens[_navbarController.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavbarController>(builder: (_) {
        return BottomNavigationBar(
            currentIndex: _navbarController.selectedIndex,
            onTap: _navbarController.changeIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard), label: 'Category'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Card'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline_rounded),
                  label: 'Wishlist'),
            ]);
      }),
    );
  }
}
