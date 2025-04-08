import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CustomMiniButton extends StatelessWidget {
  final String iconPath;
  final Function()? onTap;
  final BoxShape shape;
  final Color? iconColor;
  final Color? bgColor;
  final double? height;

  const CustomMiniButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.shape = BoxShape.circle, // default olarak daire
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
