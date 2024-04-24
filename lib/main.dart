import 'package:cooking/onboarding/onboarding_widget.dart';
import 'package:cooking/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
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
