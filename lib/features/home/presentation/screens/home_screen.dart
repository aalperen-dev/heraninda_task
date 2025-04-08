import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:heraninda_task/core/extensions/asset_extention.dart';
import 'package:heraninda_task/core/extensions/l10n_extention.dart';
import 'package:heraninda_task/core/routes/route_names.dart';
import 'package:heraninda_task/core/theme/app_colors.dart';
import 'package:heraninda_task/features/home/data/models/product_model.dart';
import 'package:heraninda_task/features/home/presentation/widgets/custom_mini_button.dart';
import 'package:heraninda_task/features/home/presentation/widgets/selectable_chip.dart';
import '../widgets/county_dropdown.dart';
import '../widgets/product_card_widget.dart';
import '../widgets/search_bar_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SizedBox(
          height: 30,
          width: 30,
          child: CustomMiniButton(
            height: 30,
            shape: BoxShape.circle,
            iconPath: context.assets.icons.burger_menu_png,
            onTap: () {
              // TODO: open drawer
            },
          ),
        ),
      ),
      title: const CountryDropdownAppBar(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: SizedBox(
            height: 30,
            width: 30,
            child: CustomMiniButton(
              height: 30,
              iconPath: context.assets.icons.bell_png,
              onTap: () {
                // TODO: open notifications
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 15,
          children: [
            SearchBarRow(controller: searchController),
            const SelectableChipList(),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 7,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final product = ProductModel(
                  productId: '111',
                  productImageUrl: 'https://picsum.photos/200/300',
                  productName: 'Wood lamp',
                  productPrice: 22.26,
                  productRating: 3.5,
                );
                return ProductCard(
                  productModel: product,
                  onTap: () {
                    // TODO: ontap function
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          gradient: const LinearGradient(
            colors: [AppColors.darkGrey, AppColors.darkTeal],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: GNav(
          tabBackgroundGradient: const LinearGradient(
            colors: [AppColors.primaryBlue, AppColors.cyan],
          ),
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 8,
          activeColor: Colors.black,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          tabBackgroundColor: Colors.grey[100]!,
          color: Colors.black,
          tabs: [
            GButton(
              icon: Icons.home,
              iconColor: AppColors.white,
              iconActiveColor: AppColors.white,
              text: context.translate.home,
              textColor: AppColors.white,
            ),
            GButton(
              icon: Icons.shopping_cart_outlined,
              iconColor: AppColors.white,
              iconActiveColor: AppColors.white,
              text: context.translate.cart,
              textColor: AppColors.white,
            ),
            GButton(
              icon: Icons.favorite_border_outlined,
              iconActiveColor: AppColors.white,
              iconColor: Colors.white,
              text: context.translate.favorites,
              textColor: AppColors.white,
            ),
            GButton(
              icon: Icons.person_outline_outlined,
              iconActiveColor: AppColors.white,
              iconColor: Colors.white,
              text: context.translate.profile,
              textColor: AppColors.white,
            ),
          ],
          selectedIndex: 0,
          onTabChange: (index) {
            if (index == 3) {
              context.navigator.pushNamed(RouteNames.authMain);
            }
          },
        ),
      ),
    );
  }
}
