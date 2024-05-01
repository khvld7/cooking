import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/client/hive_names.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/onboarding/onboarding_widget.dart';
import 'package:cooking/screens/screens.dart';
import 'package:cooking/screens/views/add_instructions.dart';
import 'package:cooking/screens/views/add_purchases.dart';
import 'package:cooking/screens/views/add_recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RecipesDBAdapter());
  await Hive.openBox<RecipesDB>(HiveBoxes.recipes);
  Hive.registerAdapter(InstructionsAdapter());
  await Hive.openBox<Instructions>(HiveBoxes.instructions);
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  runApp(
    // DevicePreview(
    // enabled: true,
    // builder: (context) =>
    MyApp(),
    // ),
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
            toolbarHeight: 150,
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
          '/add_recipes': (context) => AddRecipes(),
          '/add_instructions': (context) => AddInstructions(),
          '/add_purchases': (context) => AddPurchases(),
        },
        initialRoute:
            initScreen == 0 || initScreen == null ? '/onboarding' : '/screens');
  }
}
