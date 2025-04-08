import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final Color? bgColor;
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
        height: kToolbarHeight,
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
