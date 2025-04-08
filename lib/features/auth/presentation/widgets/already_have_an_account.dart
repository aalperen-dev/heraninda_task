import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:heraninda_task/core/extensions/l10n_extention.dart';
import 'package:heraninda_task/core/routes/route_names.dart';
import 'package:heraninda_task/core/theme/app_colors.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Text(
          context.translate.already_have_account,
          style: context.textStyles.bodyMedium,
        ),
        GestureDetector(
          onTap: () {
            context.navigator.pushNamed(RouteNames.login);
          },
          child: Text(
            context.translate.log_in,
            style: context.textStyles.titleSmall.copyWith(
              color: AppColors.primaryBlue,
            ),
          ),
        ),
      ],
    );
  }
}
