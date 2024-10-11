import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/providers/settings_provider/settings_provider.dart';
import 'package:islami/styles/my_theme_data.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/home/tabs/hadeth_tab/hadeth_details/hadeth_details_screen.dart';
import 'package:islami/ui/home/tabs/quran_tab/quran_details/quran_details.dart';
import 'package:islami/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider()
        ..getLang()
        ..getTheme(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('ar'), // Arabic
          ],
          locale: (provider.currentLang),
          routes: {
            SplashScreen.routeName: (_) => const SplashScreen(),
            HomeScreen.routeName: (_) => const HomeScreen(),
            QuranDetailsScreen.routeName: (_) => QuranDetailsScreen(),
            HadethDetailsScreen.routeName: (_) => const HadethDetailsScreen(),
          },
          theme: MyThemeData.lightTheme,
          darkTheme: MyThemeData.darkTheme,
          themeMode: provider.currentTheme,
        );
      },
    );
  }
}
