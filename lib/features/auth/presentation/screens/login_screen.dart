import 'dart:developer';

import 'package:auto_validate/auto_validate.dart';
import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:heraninda_task/core/extensions/asset_extention.dart';
import 'package:heraninda_task/core/extensions/l10n_extention.dart';
import 'package:heraninda_task/core/theme/app_colors.dart';
import 'package:heraninda_task/features/auth/presentation/widgets/custom_button.dart';
import 'package:heraninda_task/features/auth/presentation/widgets/custom_text_form_field.dart';
import '../../../../core/routes/route_names.dart';
import '../widgets/alternative_logins.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isRememberMeChecked = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // image
              Image.asset(context.assets.images.login_png, height: 100),
              // info text
              _buildInfoText(context),
              // login form section
              _buildLoginForm(context),
              // alternative logins section
              AlternativeLoginSection(),
              // already have an account section
              _buildRegisterSection(context),
              const SizedBox(height: kToolbarHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoText(BuildContext context) {
    return Column(
      children: [
        Text(
          context.translate.log_in,
          style: context.textStyles.titleMedium.copyWith(
            color: AppColors.primaryBlue,
          ),
        ),
        Text(
          context.translate.welcome_msg,
          style: context.textStyles.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 5,
        children: [
          // e mail
          CustomTextFormField(
            hintText: context.translate.enter_email,
            controller: emailController,
            prefixIconPath: context.assets.icons.email_png,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.translate.email_required;
              } else if (!value.isValidEmail) {
                return context.translate.invalid_email;
              }
              return null;
            },
          ),
          // password
          CustomTextFormField(
            hintText: context.translate.enter_password,
            controller: passwordController,
            prefixIconPath: context.assets.icons.password_png,
            isObscure: true,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.translate.password_required;
              } else if (value.length < 6) {
                return context.translate.password_min_length;
              }
              return null;
            },
          ),
          // remember me & forget pass
          _buildRememberMeRow(context),
          // login button
          CustomButton(
            buttonText: context.translate.log_in,
            onTap: () {
              if (formKey.currentState?.validate() ?? false) {
                log('Form is valid');
              } else {
                log('Form is invalid');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRememberMeRow(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isRememberMeChecked = !isRememberMeChecked;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox.adaptive(
                value: isRememberMeChecked,
                onChanged: (value) {
                  // TODO: remember me function
                  setState(() {
                    isRememberMeChecked = value ?? false;
                  });
                },
              ),
              Text(
                context.translate.remember_me,
                style: context.textStyles.bodySmall.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              // TODO: forget password function
            },
            child: Text(
              context.translate.forget_password,
              style: context.textStyles.bodySmall.copyWith(
                color: AppColors.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Text(
          context.translate.dont_have_account,
          style: context.textStyles.bodyMedium,
        ),
        GestureDetector(
          onTap: () {
            context.navigator.pushNamed(RouteNames.signup);
          },
          child: Text(
            context.translate.sign_up,
            style: context.textStyles.titleSmall.copyWith(
              color: AppColors.primaryBlue,
            ),
          ),
        ),
      ],
    );
  }
}
