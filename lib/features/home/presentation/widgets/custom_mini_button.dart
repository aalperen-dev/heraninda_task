import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// [CustomMiniButton], özelleştirilebilir küçük boyutlu bir butondur.
///
/// Bu widget, özellikle dairesel veya köşeli küçük ikon butonları oluşturmak
/// için kullanılır. Genellikle aksiyon ikonları, mini kontroller veya simge
/// temelli buton ihtiyaçlarında tercih edilir.
///
/// [CustomMiniButton] bir [StatelessWidget] olarak tanımlanmıştır.
/// İkon resmi bir asset dosyası üzerinden yüklenir ve istenirse arka plan rengi,
/// ikon rengi, şekli ve yüksekliği gibi özelleştirmeler yapılabilir.
///
/// Örnek kullanım:
/// ```dart
/// CustomMiniButton(
///   iconPath: 'assets/icons/edit.png',
///   onTap: () {
///     // Butona tıklandığında yapılacak işlem
///   },
///   shape: BoxShape.circle,
///   bgColor: Colors.white,
///   iconColor: Colors.black,
/// )
/// ```
class CustomMiniButton extends StatelessWidget {
  /// Butonun içerisinde gösterilecek ikonun asset yoludur.
  final String iconPath;

  /// Butona tıklanıldığında çalıştırılacak callback fonksiyonu.
  final Function()? onTap;

  /// Butonun şekli. Varsayılan olarak [BoxShape.circle].
  final BoxShape shape;

  /// İkonun rengi. Varsayılan olarak siyah (`AppColors.black`).
  final Color? iconColor;

  /// Arka plan rengi. Varsayılan olarak açık gri (`AppColors.lightGrey`).
  final Color? bgColor;

  /// Butonun yüksekliği (ve genişliği, çünkü buton kare şeklindedir).
  /// Belirtilmezse varsayılan olarak 32 kullanılır.
  final double? height;

  /// [CustomMiniButton] constructor'ı.
  ///
  /// [iconPath] parametresi zorunludur.
  /// Diğer tüm parametreler opsiyoneldir ve varsayılan değerlerle gelir.
  const CustomMiniButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.shape = BoxShape.circle,
    this.iconColor,
    this.bgColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final double size = height ?? 32;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.lightGrey,
          shape: shape,
          border:
              (shape == BoxShape.circle && height == null)
                  ? Border.all(color: AppColors.mediumGrey, width: 2)
                  : null,
          borderRadius:
              shape == BoxShape.circle ? null : BorderRadius.circular(size / 4),
        ),
        child: Image.asset(
          iconPath,
          color: iconColor ?? AppColors.black,
          height: 20,
        ),
      ),
    );
  }
}
