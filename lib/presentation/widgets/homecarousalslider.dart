import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceflutter/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCarousalSlider extends StatefulWidget {
  const HomeCarousalSlider({super.key});

  @override
  State<HomeCarousalSlider> createState() => _HomeCarousalSliderState();
}

class _HomeCarousalSliderState extends State<HomeCarousalSlider> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCarouselSlider(),
        const SizedBox(
          height: 8,
        ),
        _buildDotIndicator()
      ],
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
        options: CarouselOptions(
          onPageChanged: (index, _) {
            _selectedPageIndex.value = index;
          },
          height: 200.0,
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
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8)),
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
                    width: 15,
                    height: 15,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                        color: i == selectedIndex
                            ? AppColors.primaryColor
                            : null,
                        border: Border.all(
                            color: i == selectedIndex
                                ? AppColors.primaryColor
                                : Colors.grey,
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
