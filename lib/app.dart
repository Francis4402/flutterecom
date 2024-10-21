import 'package:ecommerceflutter/presentation/screens/splash_screen.dart';
import 'package:ecommerceflutter/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: AppColors.primaryColor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primaryColor
        ),
        textTheme: _textTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryColor
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16
              )
          ),
        )
      ),
    );
  }

  TextTheme _textTheme() => const TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      color: Colors.blueGrey,
    ),
  );

  InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w400,
    ),
      border: _outlineInputBorder(),
      focusedBorder: _outlineInputBorder(),
      enabledBorder: _outlineInputBorder(),
      errorBorder: _outlineInputBorder().copyWith(
          borderSide: const BorderSide(color: Colors.red)
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
  );

  OutlineInputBorder _outlineInputBorder() => const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor)
  );
}
