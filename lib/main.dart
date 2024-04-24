import 'package:cooking/components/style.dart';
import 'package:cooking/onboarding/onboarding_widget.dart';
import 'package:cooking/screens/screens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleSpacing: 24,
          titleTextStyle: textStyleAppBar,
          toolbarHeight: 200,
        ),
      ),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: ScreenUtilInit(
          minTextAdapt: true,
          designSize: Size(360, 690),
          splitScreenMode: true,
          builder: (context, child) => OnboardingScreen()),
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/screens': (context) => Screens(),
      },
    );
  }
}
