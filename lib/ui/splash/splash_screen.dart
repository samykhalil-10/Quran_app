import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/providers/settings_provider/settings_provider.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    var provide = Provider.of<SettingsProvider>(context);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        provide.currentTheme == ThemeMode.light
            ? 'assets/images/splash.png'
            : 'assets/images/splash_dark.png',
        width: double.infinity.w,
        height: double.infinity.h,
        fit: BoxFit.fill,
      ),
    );
  }
}
