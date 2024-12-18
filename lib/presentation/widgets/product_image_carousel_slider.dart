import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceflutter/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({super.key});

  @override
  State<ProductImageCarouselSlider> createState() => _ProductImageCarousalSliderState();
}

class _ProductImageCarousalSliderState extends State<ProductImageCarouselSlider> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            _buildCarouselSlider(),
            Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: _buildDotIndicator()
            ),
          ],
        )
      ],
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: (index, _) {
          _selectedPageIndex.value = index;
        },
        height: 220.0,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        autoPlay: true,
        initialPage: 0,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade300,
                alignment: Alignment.center,
                child: Text(
                  'text $i',
                  style: const TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    );
  }

  Widget _buildDotIndicator() {
    return ValueListenableBuilder(
        valueListenable: _selectedPageIndex,
        builder: (context, selectedIndex, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      color: i == selectedIndex
                          ? AppColors.primaryColor
                          : Colors.white,
                      border: Border.all(
                          color: i == selectedIndex
                              ? AppColors.primaryColor
                              : Colors.white,
                          width: 1),
                      borderRadius: BorderRadius.circular(50)),
                )
            ],
          );
        });
  }

  @override
  void dispose() {
    _selectedPageIndex.dispose();
    super.dispose();
  }
}
