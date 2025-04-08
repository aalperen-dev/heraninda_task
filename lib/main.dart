import 'package:flutter/material.dart';
import 'package:heraninda_task/core/routes/app_routes.dart';
import 'package:heraninda_task/core/routes/route_names.dart';
import 'package:heraninda_task/core/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/theme/text_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        textTheme: AppTextTheme.textTheme,
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.white),
      ),
      initialRoute: RouteNames.splash,
      routes: AppRoutes.routes,
    );
  }
}
