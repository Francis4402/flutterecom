import 'package:ecommerceflutter/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:ecommerceflutter/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});


  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavbarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist'),
          leading: IconButton(onPressed: () {
            Get.find<MainBottomNavbarController>().backToHome();
          }, icon: const Icon(Icons.arrow_back_ios_sharp)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 25,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.54,
            ),
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: FittedBox(
                  child: ProductCard(
                    showAddToWishlist: false,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
