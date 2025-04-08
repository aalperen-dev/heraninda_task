import 'dart:developer';

import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:heraninda_task/core/extensions/asset_extention.dart';
import 'package:heraninda_task/core/extensions/l10n_extention.dart';
import 'package:heraninda_task/core/theme/app_colors.dart';
import 'package:heraninda_task/features/auth/presentation/widgets/already_have_an_account.dart';
import 'package:heraninda_task/features/auth/presentation/widgets/custom_button.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // image
              Image.asset(context.assets.images.otp_png),
              // otp info section
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.translate.otp_verification,
                    style: context.textStyles.titleMedium.copyWith(
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  Text(context.translate.otp_msg),
                ],
              ),

              // otp code and submit section
              Form(
                key: formKey,
                child: Column(
                  spacing: 30,
                  children: [
                    PinInputTextField(
                      pinLength: 6,
                      controller: otpController,
                      decoration: BoxLooseDecoration(
                        textStyle: context.textStyles.titleMedium.copyWith(
                          color: AppColors.primaryBlue,
                        ),
                        hintText: '000000',
                        hintTextStyle: context.textStyles.titleMedium.copyWith(
                          color: AppColors.softBlue,
                        ),
                        strokeColorBuilder: FixedColorBuilder(
                          Colors.transparent,
                        ),
                        bgColorBuilder: FixedColorBuilder(AppColors.lightGrey),
                      ),
                    ),
                    CustomButton(
                      buttonText: context.translate.confirm,
                      onTap: () {
                        final otp = otpController.text.trim();

                        if (otp == '111111') {
                          // OTP is correct
                          log('OTP is correct');
                          // TODO: Navigate to home
                        } else {
                          // OTP is incorrect
                          log('OTP is incorrect');
                        }
                      },
                    ),
                  ],
                ),
              ),

              AlreadyHaveAccountWidget(),
              const SizedBox(height: kToolbarHeight),
            ],
          ),
        ),
      ),
    );
  }
}
