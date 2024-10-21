import 'package:ecommerceflutter/presentation/utility/app_colors.dart';
import 'package:ecommerceflutter/presentation/widgets/category_item.dart';
import 'package:ecommerceflutter/presentation/widgets/homecarousalslider.dart';
import 'package:ecommerceflutter/presentation/widgets/product_card.dart';
import 'package:ecommerceflutter/presentation/widgets/section_header.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utility/asset_path.dart';
import '../widgets/app_bar_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildSearchTextField(),
                const SizedBox(
                  height: 16,
                ),
                const HomeCarousalSlider(),
                const SizedBox(
                  height: 16,
                ),
                SectionHeader(title: 'All Category', onTapSeeAll: () {}),
                const SizedBox(
                  height: 10,
                ),
                _buildCategoryListView(),
                const SizedBox(
                  height: 8,
                ),
                SectionHeader(title: 'Popular Products', onTapSeeAll: () {}),
                const SizedBox(
                  height: 10,
                ),
                const ProductCard()
              ],
            ),
          ),
        ));
  }

  SizedBox _buildCategoryListView() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const CategoryItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 16,
          );
        },
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: _searchTEController,
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appNavLogoSvg),
      actions: [
        AppBarButtons(
          icon: Icons.person_outline,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarButtons(
          icon: Icons.call_outlined,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarButtons(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchTEController.dispose();
    super.dispose();
  }
}


