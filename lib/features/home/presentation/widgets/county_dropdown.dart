import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:heraninda_task/core/theme/app_colors.dart';

class CountryDropdownAppBar extends StatefulWidget {
  const CountryDropdownAppBar({super.key});

  @override
  State<CountryDropdownAppBar> createState() => _CountryDropdownAppBarState();
}

class _CountryDropdownAppBarState extends State<CountryDropdownAppBar> {
  String selectedCountry = 'United States';

  final List<Map<String, dynamic>> countries = [
    {'name': 'United States', 'icon': Icons.pin_drop_outlined},
    {'name': 'Germany', 'icon': Icons.pin_drop_outlined},
    {'name': 'France', 'icon': Icons.pin_drop_outlined},
    {'name': 'Japan', 'icon': Icons.pin_drop_outlined},
    {'name': 'Brazil', 'icon': Icons.pin_drop_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedCountry,
        icon: const Icon(Icons.keyboard_arrow_down),
        style: const TextStyle(color: AppColors.black, fontSize: 16),
        onChanged: (value) {
          setState(() {
            selectedCountry = value!;
          });
        },
        items:
            countries.map((country) {
              return DropdownMenuItem<String>(
                value: country['name'],
                child: Row(
                  children: [
                    Icon(country['icon'], size: 16, color: AppColors.red),
                    const SizedBox(width: 8),
                    Text(
                      country['name'],
                      style: context.textStyles.labelMedium,
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
