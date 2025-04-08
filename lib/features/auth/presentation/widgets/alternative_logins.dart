import 'package:flutter/material.dart';
import 'package:heraninda_task/core/extensions/l10n_extention.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/theme/app_colors.dart';
import 'custom_chip_button.dart';

class AlternativeLoginSection extends StatelessWidget {
  const AlternativeLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        // divider
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                context.translate.log_in_with,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        // login chips
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            CustomChipButton(
              brandName: Brands.facebook,
              onTap: () {
                // TODO: facebook login function
              },
            ),
            CustomChipButton(
              brandName: Brands.google,
              onTap: () {
                // TODO: google login function
              },
            ),
            CustomChipButton(
              brandName: Brands.apple_logo,
              onTap: () {
                // TODO: apple login function
              },
              iconColor: AppColors.black,
            ),
          ],
        ),
      ],
    );
  }
}
