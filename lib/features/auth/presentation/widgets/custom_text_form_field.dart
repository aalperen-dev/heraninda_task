import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String prefixIconPath;
  final TextInputType keyboardType;
  final double? height;
  final bool? isObscure;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.prefixIconPath,
    required this.keyboardType,
    this.height,
    this.isObscure,
    this.onChanged,
    this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = false;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.height ?? kToolbarHeight,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: TextFormField(
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            obscureText: widget.isObscure == true ? !showPassword : false,
            onChanged: (value) {
              widget.onChanged?.call(value);
              final validation = widget.validator?.call(value);
              setState(() {
                errorText = validation;
              });
            },
            validator: (value) {
              final validation = widget.validator?.call(value);
              setState(() {
                errorText = validation;
              });
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              isCollapsed: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 10,
              ),
              hintText: widget.hintText,
              hintStyle: context.textStyles.titleSmall,
              errorText: null,
              errorStyle: const TextStyle(height: 0),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 40,
                minHeight: 40,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  widget.prefixIconPath,
                  color: AppColors.mediumGrey,
                  height: 20,
                  width: 20,
                ),
              ),
              suffixIcon:
                  widget.isObscure == null
                      ? null
                      : IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(
                          showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.mediumGrey,
                        ),
                      ),
            ),
          ),
        ),
        const SizedBox(height: 2),
        AnimatedOpacity(
          opacity: errorText == null ? 0 : 1,
          duration: const Duration(milliseconds: 200),
          child: SizedBox(
            height: 16,
            child: Text(
              errorText ?? '',
              style: context.textStyles.labelSmall.copyWith(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
