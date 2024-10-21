
import 'package:ecommerceflutter/presentation/screens/complete_profile_screen.dart';
import 'package:ecommerceflutter/presentation/utility/app_colors.dart';
import 'package:ecommerceflutter/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 100,),
                const AppLogo(),
                const SizedBox(height: 16,),
                Text('Enter Otp Code', style: textTheme.titleLarge,),
                const SizedBox(height: 4),
                Text(
                  "A 4 digit OTP code has been send",
                  style: textTheme.titleSmall,
                ),
                const SizedBox(height: 24),
                _buildPinField(),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: () {Get.to(() => const CompleteProfileScreen());}, child: const Text('Next')),
                const SizedBox(height: 16),
                _buildResendCodeMessage(),
                TextButton(onPressed: () {}, child: const Text('Resend Code'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResendCodeMessage() {
    return RichText(text: const TextSpan(
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
              text: 'This code will expire in '
          ),
          TextSpan(
            text: '100s',
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
        ]
    ));
  }

  Widget _buildPinField() {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.transparent,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: _otpTEditingController,
      appContext: context,

    );
  }

  @override
  void dispose() {
    _otpTEditingController.dispose();
    super.dispose();
  }
}
