import 'package:e_commerce_app_project/admin/adPage/adHome.dart';
import 'package:e_commerce_app_project/admin/adPage/adMain.dart';
import 'package:e_commerce_app_project/core/extension/change_theme.dart';
import 'package:e_commerce_app_project/page/home.dart';
import 'package:e_commerce_app_project/page/main_cover_screen.dart';
import 'package:e_commerce_app_project/page/started/splashed_screen.dart';
import 'package:e_commerce_app_project/page/user/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 141, 108, 97),
);

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Color.fromARGB(255, 255, 106, 51)
    //  Color.fromARGB(255, 6, 79, 100),
    );

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeUltilities(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeUltilities>(context);
    return MaterialApp(
      //routerConfig: router,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        iconTheme: IconThemeData(color: kDarkColorScheme.inversePrimary),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.onSecondary),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: kColorScheme.primary),
        ),
        iconTheme: IconThemeData(color: kColorScheme.onSecondaryContainer),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 16),
            ),
      ),
      themeMode: themeMode.themeMode,
      home: SignInScreen(),
    );
  }
}
