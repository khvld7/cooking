import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/client/hive_names.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/onboarding/onboarding_widget.dart';
import 'package:cooking/screens/screens.dart';
import 'package:cooking/screens/views/add_instructions.dart';
import 'package:cooking/screens/views/add_plan_menu.dart';
import 'package:cooking/screens/views/add_purchases.dart';
import 'package:cooking/screens/views/add_recipes.dart';
import 'package:cooking/screens/views/instructions_details.dart';
import 'package:cooking/screens/views/menu_details.dart';
import 'package:cooking/screens/views/recipe_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

int? initScreen;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(IngredientsDBAdapter());
  await Hive.openBox<IngredientsDB>(HiveBoxes.ingredients);
  Hive.registerAdapter(InstructionsDBAdapter());
  await Hive.openBox<InstructionsDB>(HiveBoxes.instructions);
  Hive.registerAdapter(RecipesDBAdapter());
  await Hive.openBox<RecipesDB>(HiveBoxes.recipes);
  Hive.registerAdapter(DayMenuDBAdapter());
  await Hive.openBox<DayMenuDB>(HiveBoxes.dayMenu);
  Hive.registerAdapter(MenuDBAdapter());
  await Hive.openBox<MenuDB>(HiveBoxes.menu);
  Hive.registerAdapter(PurchasesDBAdapter());
  await Hive.openBox<PurchasesDB>(HiveBoxes.purchases);
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);

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
        localizationsDelegates: <LocalizationsDelegate<Object>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ru', 'RU'),
          const Locale('en', 'US'),
        ],
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            titleSpacing: 24,
            titleTextStyle: textStyleAppBar,
            toolbarHeight: 150,
          ),
        ),
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: ScreenUtilInit(minTextAdapt: true, designSize: Size(360, 690), splitScreenMode: true, builder: (context, child) => OnboardingScreen()),
        routes: {
          '/onboarding': (context) => OnboardingScreen(),
          '/screens': (context) => Screens(),
          '/add_recipes': (context) => AddRecipes(),
          '/add_instructions': (context) => AddInstructions(),
          '/add_purchases': (context) => AddPurchases(),
          '/add_plan_menu': (context) => AddPlanMenu(),
          '/recipe_details': (context) => RecipeDetails(),
          '/instructions_details': (context) => InstructionsDetails(),
        },
        initialRoute: initScreen == 0 || initScreen == null ? '/onboarding' : '/screens');
  }
}
