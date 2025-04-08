import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:heraninda_task/core/extensions/asset_extention.dart';
import 'package:heraninda_task/features/home/data/models/product_model.dart';

import '../../../../core/theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  final Function()? onTap;
  const ProductCard({super.key, this.onTap, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 190,
        width: 150,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.lightBlueBackground,
          border: Border.all(width: 2, color: AppColors.primaryBlue),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // product image
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(productModel.productImageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // product name and rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productModel.productName!,
                  style: context.textStyles.labelSmall.copyWith(
                    color: AppColors.primaryBlue,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
                Row(
                  children: [
                    Icon(Icons.star_rounded, color: AppColors.orange, size: 10),
                    Text(
                      productModel.productRating!.toString(),
                      style: context.textStyles.labelSmall.copyWith(
                        fontSize: 8,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // product price and add to fav button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${productModel.productPrice.toString()}',
                  style: context.textStyles.titleMedium.copyWith(fontSize: 9),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),

                //
                GestureDetector(
                  onTap: () {
                    // TODO: add product to favs function
                  },
                  child: Image.asset(context.assets.icons.cyan_plus_png),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
