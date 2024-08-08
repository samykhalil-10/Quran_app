import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/providers/quran_details_provider/quran_details_provider.dart';
import 'package:islami/providers/settings_provider/settings_provider.dart';
import 'package:islami/styles/my_theme_data.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/home/tabs/hadeth_tab/hadeth_details/hadeth_details_screen.dart';
import 'package:islami/ui/home/tabs/quran_tab/quran_details/quran_details.dart';
import 'package:islami/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
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
      locale: Locale(provider.currentLang),
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        QuranDetailsScreen.routeName: (_) => ChangeNotifierProvider(
            create: (context) => QuranDetailsProvider(),
            child: QuranDetailsScreen()),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.currentTheme,
    );
  }
}
