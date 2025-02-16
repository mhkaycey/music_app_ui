import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/src/features/dashboard/index.dart';
import 'package:music_app/src/theme/color.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.organge,
        ),
        scaffoldBackgroundColor: AppColors.background,
        drawerTheme: const DrawerThemeData(
          backgroundColor: AppColors.background,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.white),
          actionsIconTheme: IconThemeData(color: AppColors.white),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 20,
          ),
        ),
        popupMenuTheme: const PopupMenuThemeData(
          menuPadding: EdgeInsets.zero, // Remove or reduce padding globally
          elevation: 0,

          iconColor: AppColors.white,
          textStyle: TextStyle(
            color: AppColors.white,
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Dashboard(),
    );
  }
}
