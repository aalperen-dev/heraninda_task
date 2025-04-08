import 'package:flutter/material.dart';
import 'package:heraninda_task/core/routes/route_names.dart';
import 'package:heraninda_task/features/auth/presentation/screens/otp_screen.dart';
import 'package:heraninda_task/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:heraninda_task/features/home/presentation/screens/home_screen.dart';
import 'package:heraninda_task/features/splash/presentation/screens/splash_screen.dart';

import '../../features/auth/presentation/screens/auth_main_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    RouteNames.splash: (context) => const SplashScreen(),
    RouteNames.authMain: (context) => const AuthMainScreen(),
    RouteNames.login: (context) => const LoginScreen(),
    RouteNames.signup: (context) => const SignUpScreen(),
    RouteNames.otp: (context) => const OtpScreen(),
    RouteNames.home: (context) => const HomeScreen(),
  };
}
