import 'package:ecommerceflutter/presentation/screens/home_screen.dart';
import 'package:ecommerceflutter/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreen();
}

class _CompleteProfileScreen extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEditingController =
      TextEditingController();
  final TextEditingController _lastNameTEditingController =
      TextEditingController();
  final TextEditingController _mobileTEditingController =
      TextEditingController();
  final TextEditingController _cityTEditingController = TextEditingController();

  final TextEditingController _shippingAddressTEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: _buildCompleteForm(textTheme),
          ),
        ),
      ),
    );
  }

  Widget _buildCompleteForm(TextTheme textTheme) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        const AppLogo(),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Complete Profile',
          style: textTheme.titleLarge,
        ),
        const SizedBox(height: 4),
        Text(
          "Get started with us by providing your details",
          style: textTheme.titleSmall,
        ),
        const SizedBox(height: 24),
        _buildCompleteInputs(textTheme),
      ],
    );
  }

  Form _buildCompleteInputs(TextTheme textTheme) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _firstNameTEditingController,
            decoration: const InputDecoration(
              hintText: 'First Name',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _lastNameTEditingController,
            decoration: const InputDecoration(
              hintText: 'Last Name',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _mobileTEditingController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Mobile',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _cityTEditingController,
            decoration: const InputDecoration(
              hintText: 'City',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            maxLines: 3,
            controller: _shippingAddressTEditingController,
            decoration: const InputDecoration(
              hintText: 'Shipping address',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () {Get.off(() => const HomeScreen());}, child: const Text('Complete')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTEditingController.dispose();
    _lastNameTEditingController.dispose();
    _mobileTEditingController.dispose();
    _cityTEditingController.dispose();
    _shippingAddressTEditingController.dispose();
    super.dispose();
  }
}
