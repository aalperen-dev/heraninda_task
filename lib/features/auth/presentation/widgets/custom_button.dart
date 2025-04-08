import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// [CustomButton] uygulama genelinde kullanılabilecek özelleştirilebilir bir buton bileşenidir.
///
/// Bu buton, kullanıcıdan bir eylem tetiklemek için kullanılabilir.
/// Arka plan rengi, yazı rengi ve buton yazısı parametre olarak verilebilir.
/// Butona tıklanma durumunda `onTap` fonksiyonu çalıştırılır.
///
/// Genellikle form gönderimleri, sayfa geçişleri veya eylem butonları olarak kullanılır.
///
/// Örnek kullanım:
/// ```dart
/// CustomButton(
///   buttonText: 'Giriş Yap',
///   onTap: () => print('Tıklandı'),
/// )
/// ```
class CustomButton extends StatelessWidget {
  /// Buton üzerinde gösterilecek metin.
  final String buttonText;

  /// Butonun dış sınır rengi. (Şu an kullanılmıyor, isteğe göre geliştirilebilir)
  final Color? buttonColor;

  /// Yazı rengi. Varsayılan olarak beyazdır.
  final Color? textColor;

  /// Arka plan rengi. Varsayılan olarak [AppColors.primaryBlue] kullanılır.
  final Color? bgColor;

  /// Butona tıklanınca çalışacak fonksiyon.
  final Function()? onTap;

  const CustomButton({
    super.key,
    required this.buttonText,
    this.buttonColor,
    this.textColor,
    this.bgColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: bgColor ?? AppColors.primaryBlue,
        ),
        alignment: Alignment.center,
        height: kToolbarHeight, // 56.0 sabit yüksekliği temsil eder
        width: double.infinity,
        child: Text(
          buttonText,
          style: context.textStyles.titleMedium.copyWith(
            color: textColor ?? AppColors.white,
          ),
        ),
      ),
    );
  }
}
