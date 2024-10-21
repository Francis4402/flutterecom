import 'package:ecommerceflutter/presentation/screens/otp_verification_screen.dart';
import 'package:ecommerceflutter/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEditingController = TextEditingController();

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
                const SizedBox(height: 16),
                Text("WelCome Back", style: textTheme.titleLarge),
                const SizedBox(height: 4),
                Text(
                  "Enter Your Email Address",
                  style: textTheme.titleSmall,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email'
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: () {
                  Get.to(() => OtpVerificationScreen(email: _emailTEditingController.text));
                }, child: const Text('Next'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEditingController.dispose();
    super.dispose();
  }
}
