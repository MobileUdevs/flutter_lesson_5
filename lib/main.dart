import 'package:bootcamp_sample_app/routes/app_pages.dart';
import 'package:bootcamp_sample_app/routes/app_routes.dart';
import 'package:bootcamp_sample_app/theme/app_contats.dart';
import 'package:bootcamp_sample_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppContants.key,
      title: 'Simple app',
      routes: AppPages.page,
      themeMode: ThemeMode.light,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      initialRoute: AppRoutes.initial,
      debugShowCheckedModeBanner: false,
    );
  }
}
