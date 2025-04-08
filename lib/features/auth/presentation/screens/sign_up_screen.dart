import 'dart:developer';

import 'package:auto_validate/auto_validate.dart';
import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:heraninda_task/core/extensions/asset_extention.dart';
import 'package:heraninda_task/core/extensions/l10n_extention.dart';
import 'package:heraninda_task/core/routes/route_names.dart';
import 'package:heraninda_task/core/theme/app_colors.dart';
import 'package:heraninda_task/features/auth/data/models/user_model.dart';
import 'package:heraninda_task/features/auth/presentation/widgets/alternative_logins.dart';
import 'package:heraninda_task/features/auth/presentation/widgets/custom_button.dart';
import 'package:heraninda_task/features/auth/presentation/widgets/custom_text_form_field.dart';
import '../widgets/already_have_an_account.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.navigator.pushNamed(RouteNames.otp);
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              // signup info section
              _buildSignUpInfo(context),
              // signup form section
              _buildSignUpForm(context),
              // alternative login methods
              const AlternativeLoginSection(),
              // already have an account section
              AlreadyHaveAccountWidget(),
              const SizedBox(height: kToolbarHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          context.translate.sign_up,
          style: context.textStyles.titleMedium.copyWith(
            color: AppColors.primaryBlue,
          ),
        ),
        Text(
          context.translate.sign_up_msg,
          style: context.textStyles.titleSmall.copyWith(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSignUpForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 5,
        children: [
          // name
          CustomTextFormField(
            hintText: context.translate.enter_name,
            controller: nameController,
            prefixIconPath: context.assets.icons.person_filled_png,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.translate.name_is_required;
              }
              return null;
            },
          ),
          // email
          CustomTextFormField(
            hintText: context.translate.enter_email,
            controller: emailController,
            prefixIconPath: context.assets.icons.email_png,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.translate.email_required;
              } else if (value.isValidEmail) {
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
            keyboardType: TextInputType.visiblePassword,
            isObscure: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.translate.password_required;
              } else if (value.length < 6) {
                return context.translate.password_min_length;
              }
              return null;
            },
          ),
          // confirm password
          CustomTextFormField(
            hintText: context.translate.confirm_password,
            controller: confirmPasswordController,
            prefixIconPath: context.assets.icons.password_png,
            keyboardType: TextInputType.visiblePassword,
            isObscure: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.translate.pls_confirm_your_password;
              } else if (value != passwordController.text) {
                return context.translate.passwords_dont_match;
              }
              return null;
            },
          ),
          // form button
          CustomButton(
            buttonText: context.translate.sign_up,
            onTap: () {
              // Validate the form
              if (formKey.currentState?.validate() ?? false) {
                log('Form is valid');
                // If form is valid, proceed with sign up
                // TODO: creta an user then navigate to otp screen
                final user = UserModel(
                  userId: '0',
                  userFullname: nameController.text,
                  userEmail: emailController.text,
                  addresses: [],
                );
              } else {
                log('Form is invalid');
              }
            },
          ),
        ],
      ),
    );
  }
}
