import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:heraninda_task/core/extensions/asset_extention.dart';
import 'package:heraninda_task/core/extensions/l10n_extention.dart';
import 'package:heraninda_task/core/routes/route_names.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/custom_button.dart';

class AuthMainScreen extends StatelessWidget {
  const AuthMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                context.assets.images.shopping_png,
                height: 325,
                width: 320,
              ),
              Text(
                'Heranında',
                textAlign: TextAlign.center,
                style: context.textStyles.headlineMedium.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Text(
                      context.translate.having_trouble,
                      style: context.textStyles.bodyMedium,
                    ),
                    Text(
                      context.translate.let_us_help,
                      style: context.textStyles.bodyMedium,
                    ),
                  ],
                ),
              ),

              CustomButton(
                buttonText: context.translate.log_in,
                onTap: () {
                  context.navigator.pushNamed(RouteNames.login);
                },
              ),
              CustomButton(
                buttonText: context.translate.sign_up,
                bgColor: AppColors.softBlue,
                textColor: AppColors.primaryBlue,
                onTap: () {
                  context.navigator.pushNamed(RouteNames.signup);
                },
              ),
              const SizedBox(height: kToolbarHeight * 1.5),
            ],
          ),
        ),
      ),
    );
  }
}
