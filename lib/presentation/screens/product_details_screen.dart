import 'package:ecommerceflutter/presentation/utility/app_colors.dart';
import 'package:ecommerceflutter/presentation/widgets/product_image_carousel_slider.dart';
import 'package:ecommerceflutter/presentation/widgets/wish_button.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _counterValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          const ProductImageCarouselSlider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Nike Shoe 2024 Latest Edition 80AFE45',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.8)),
                    )),
                    _buildCounter(),
                  ],
                ),
                _buildReviewSection(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildReviewSection() {
    return Wrap(
                  spacing: 5,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Wrap(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Text('3.4')
                      ],
                    ),
                    TextButton(onPressed: (){}, child: const Text('Reviews')),
                    const WishButton()
                  ],
              );
  }

  Widget _buildCounter() {
    return ItemCount(
        initialValue: _counterValue,
        minValue: 1,
        maxValue: 20,
        color: AppColors.primaryColor,
        onChanged: (value) {
          _counterValue = value as int;
          setState(() {});
        },
        decimalPlaces: 0);
  }
}
