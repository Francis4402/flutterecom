

import 'package:ecommerceflutter/presentation/state_holders/home_slider_controller.dart';
import 'package:ecommerceflutter/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavbarController());
    Get.put(HomeSliderController());
  }
}