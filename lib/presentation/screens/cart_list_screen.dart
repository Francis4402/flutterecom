import 'package:ecommerceflutter/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:ecommerceflutter/presentation/widgets/card_product_item.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavbarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Carts'),
          leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavbarController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios_sharp)),
        ),
        body: const Column(
          children: [
             CardProductItem()
          ],
        ),
      ),
    );
  }
}
