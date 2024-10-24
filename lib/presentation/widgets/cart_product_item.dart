import 'package:ecommerceflutter/presentation/utility/app_colors.dart';
import 'package:ecommerceflutter/presentation/utility/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key});

  @override
  State<CartProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CartProductItem> {
  int _counterValue = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          _buildProductImage(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _buildProductDetails(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '\$100',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.primaryColor),
                      ),
                      _buildCounter()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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

  Widget _buildProductDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fake Shoe',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Wrap(
                spacing: 16,
                children: [
                  Text(
                    'Color: Red',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    'Size: 9',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              )
            ],
          ),
        )),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.delete_outline_sharp))
      ],
    );
  }

  Widget _buildProductImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        AssetsPath.productDummyImgSvg,
        width: 100,
      ),
    );
  }
}
