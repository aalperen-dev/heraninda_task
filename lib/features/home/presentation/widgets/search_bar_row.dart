import 'package:flutter/material.dart';
import 'package:heraninda_task/core/extensions/asset_extention.dart';
import 'package:heraninda_task/core/extensions/l10n_extention.dart';
import 'package:heraninda_task/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:heraninda_task/features/home/presentation/widgets/custom_mini_button.dart';

class SearchBarRow extends StatelessWidget {
  final TextEditingController controller;

  const SearchBarRow({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomTextFormField(
            height: 45,
            hintText: context.translate.search_destinations,
            controller: controller,
            prefixIconPath: context.assets.icons.search_png,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              // TODO: implement search
            },
          ),
        ),
        const SizedBox(width: 10),
        CustomMiniButton(
          iconPath: context.assets.icons.scanner_png,
          onTap: () {
            // TODO: implement scanner
          },
          shape: BoxShape.rectangle,
          height: 45,
        ),
      ],
    );
  }
}
