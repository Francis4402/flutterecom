import 'package:ecommerceflutter/presentation/utility/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerceflutter/presentation/utility/app_colors.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CardProductItem extends StatefulWidget {
  const CardProductItem({super.key});

  @override
  State<CardProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CardProductItem> {
  int _counterValue = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              AssetsPath.productDummyImgSvg,
              width: 100,
            ),
          ),
          Expanded(
              child: Column(
                children: [
                  Row(
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
                          onPressed: () {},
                          icon: const Icon(Icons.delete_outline_sharp))
                    ],
                  ),
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
                      ItemCount(
                          initialValue: _counterValue,
                          minValue: 1,
                          maxValue: 20,
                          color: AppColors.primaryColor,
                          onChanged: (value) {
                            _counterValue = value as int;
                            setState(() {});
                          },
                          decimalPlaces: 0)
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
