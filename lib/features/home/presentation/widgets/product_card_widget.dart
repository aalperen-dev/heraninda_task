import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:heraninda_task/core/extensions/asset_extention.dart';
import 'package:heraninda_task/features/home/data/models/product_model.dart';

import '../../../../core/theme/app_colors.dart';

/// [ProductCard], bir ürünün bilgilerini görsel olarak temsil eden kart bileşenidir.
///
/// Bu widget, bir ürünün görselini, adını, puanını ve fiyatını gösterir.
/// Aynı zamanda "favorilere ekle" gibi eylemler için de özelleştirilebilir.
/// Genellikle ürün listelerinde veya ana sayfa gibi ekranlarda kullanılır.
///
/// Kart tasarımı, mavi tonlarda kenarlıklı ve köşeleri yuvarlatılmış bir yapıya sahiptir.
/// Ürüne tıklanıldığında [onTap] fonksiyonu çağrılır.
///
/// Örnek kullanım:
/// ```dart
/// ProductCard(
///   productModel: myProduct,
///   onTap: () {
///     // Ürüne tıklandığında yapılacak işlem
///   },
/// )
/// ```
class ProductCard extends StatelessWidget {
  /// Kartta gösterilecek ürün verilerini taşıyan model.
  final ProductModel productModel;

  /// Kart tıklanıldığında çağrılacak fonksiyon.
  final Function()? onTap;

  /// [ProductCard] constructor'ı.
  ///
  /// [productModel] parametresi zorunludur.
  /// [onTap] opsiyonel olarak tıklama işlemi için tanımlanabilir.
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
            /// Ürün görseli
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

            /// Ürün ismi ve puanı
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Ürün adı
                Text(
                  productModel.productName!,
                  style: context.textStyles.labelSmall.copyWith(
                    color: AppColors.primaryBlue,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),

                /// Ürün puanı ve yıldız ikonu
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

            /// Ürün fiyatı ve favorilere ekle butonu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Ürün fiyatı
                Text(
                  '\$ ${productModel.productPrice.toString()}',
                  style: context.textStyles.titleMedium.copyWith(fontSize: 9),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),

                /// Favorilere ekle butonu (şimdilik işlevsiz)
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
