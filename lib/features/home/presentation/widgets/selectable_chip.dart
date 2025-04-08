import 'dart:developer';

import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:heraninda_task/core/extensions/l10n_extention.dart';
import 'package:heraninda_task/core/theme/app_colors.dart';

class SelectableChipList extends StatefulWidget {
  const SelectableChipList({super.key});

  @override
  State<SelectableChipList> createState() => _SelectableChipListState();
}

class _SelectableChipListState extends State<SelectableChipList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> chips = [
      context.translate.popular,
      context.translate.chair,
      context.translate.sofa,
      context.translate.lamp,
      context.translate.bed,
      context.translate.clothes,
      context.translate.popular,
      context.translate.chair,
      context.translate.sofa,
      context.translate.lamp,
      context.translate.bed,
      context.translate.clothes,
    ];

    final List<VoidCallback> chipActions = [
      () => log("1"),
      () => log("2"),
      () => log("3"),
      () => log("4"),
      () => log("5"),
      () => log("6"),
      () => log("7"),
      () => log("8"),
      () => log("9"),
      () => log("10"),
      () => log("11"),
      () => log("12"),
    ];

    return SizedBox(
      height: 27,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        itemBuilder: (context, index) {
          bool isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              chipActions[index]();
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryBlue : AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  chips[index],
                  style:
                      isSelected
                          ? context.textStyles.labelMedium.copyWith(
                            color: AppColors.white,
                          )
                          : context.textStyles.bodySmall,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
