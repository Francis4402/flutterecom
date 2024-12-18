import 'package:ecommerceflutter/presentation/utility/app_colors.dart';
import 'package:ecommerceflutter/presentation/widgets/color_picker.dart';
import 'package:ecommerceflutter/presentation/widgets/product_image_carousel_slider.dart';
import 'package:ecommerceflutter/presentation/widgets/size_picker.dart';
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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
                        const Text(
                          'Color',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ColorPicker(
                          colors: const [
                            Colors.black,
                            Colors.red,
                            Colors.amber,
                            Colors.blue,
                            Colors.purple,
                          ],
                          onChange: (Color selectedColor) {},
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Size',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizePicker(
                            sizes: const [
                              'M',
                              'L',
                              'S',
                              'XL',
                              'XXL',
                            ],
                            onChange: (String s) {
                              print(s);
                            }),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Description',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Nike Shoe 2024: \nThe Nike Shoe 2024 is the epitome of innovation and style, designed to elevate performance and comfort. Featuring cutting-edge cushioning technology, lightweight materials, and a sleek, modern aesthetic, this shoe is perfect for athletes and casual wearers alike. Its enhanced traction and breathable design ensure optimal support and durability, making it a must-have for every footwear enthusiast.'
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          _buildAddToCartSection(),
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
        TextButton(onPressed: () {}, child: const Text('Reviews')),
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

  Widget _buildAddToCartSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPriceColum(),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPriceColum() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Text(
          '\$1200',
          style: TextStyle(
              fontSize: 24,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

}
