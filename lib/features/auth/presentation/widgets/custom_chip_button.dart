import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/theme/app_colors.dart';

/// [CustomChipButton] belirli bir markaya ait ikonu ve etkileşimli bir tasarımı
/// gösteren özel bir chip buton bileşenidir.
///
/// Bu widget, [icons_plus] paketinden gelen `Brand` widget'ını kullanır ve
/// belirli bir markayı temsil eden ikonla birlikte görsel bir bileşen sunar.
///
/// Özellikler:
/// - [brandName]: `Brands` sınıfından gelen bir ikon referansıdır. Örneğin:
///   `Brands.android_studio`. Düz bir string verilmemelidir, mutlaka `Brands`
///   sınıfındaki tanımlı değerlerden biri olmalıdır.
/// - [onTap]: Butona tıklandığında çalışacak olan opsiyonel fonksiyon.
/// - [iconColor]: İkonun rengini belirlemek için opsiyonel renk parametresi.
///
/// Örnek kullanım:
/// CustomChipButton(
///   brandName: Brands.flutter,
///   onTap: () => print('Flutter icon tapped'),
///   iconColor: Colors.blue,
/// )
///

class CustomChipButton extends StatelessWidget {
  final String brandName;
  final Function()? onTap;
  final Color? iconColor;
  const CustomChipButton({
    super.key,
    required this.brandName,
    this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 95,
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.lightGrey, width: 2),
        ),

        child: Brand(
          brandName,
          size: 23,
          colorFilter:
              iconColor == null
                  ? null
                  : ColorFilter.mode(iconColor!, BlendMode.srcIn),
        ),
      ),
    );
  }
}
