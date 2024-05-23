import 'package:cooking/screens/advices.dart';
import 'package:cooking/screens/menu.dart';
import 'package:cooking/screens/purchases.dart';
import 'package:cooking/screens/recipes.dart';
import 'package:cooking/screens/settings.dart';
import 'package:cooking/screens/statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  List<Widget> screens = [
    Recipes(),
    Menu(),
    Purchases(),
    Statistics(),
    Advices(),
    Settings(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(bottom: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (_selectedIndex == 0)
                  Expanded(
                    child: Text('Рецепты'),
                  ),
                if (_selectedIndex == 1)
                  Expanded(
                    child: Text('Мое меню'),
                  ),
                if (_selectedIndex == 2)
                  Expanded(
                    child: Text('Список покупок'),
                  ),
                if (_selectedIndex == 3)
                  Expanded(
                    child: Text('Статистика'),
                  ),
                if (_selectedIndex == 4)
                  Expanded(
                    child: Text('Советы'),
                  ),
                if (_selectedIndex == 5)
                  Expanded(
                    child: Text('Настройки'),
                  ),
              ],
            ),
          ),
          flexibleSpace: Row(mainAxisSize: MainAxisSize.min, children: [
            if (_selectedIndex == 0)
              Expanded(
                child: Image.asset(
                  'assets/images/screens_image/recipes.jpeg',
                  fit: BoxFit.cover,
                  opacity: AlwaysStoppedAnimation(0.3),
                ),
              ),
            if (_selectedIndex == 1)
              Expanded(
                child: Image.asset(
                  'assets/images/screens_image/menu.jpeg',
                  fit: BoxFit.cover,
                  opacity: AlwaysStoppedAnimation(0.3),
                ),
              ),
            if (_selectedIndex == 2)
              Expanded(
                child: Image.asset(
                  'assets/images/screens_image/purchases.jpeg',
                  fit: BoxFit.cover,
                  opacity: AlwaysStoppedAnimation(0.3),
                ),
              ),
            if (_selectedIndex == 3)
              Expanded(
                child: Image.asset(
                  'assets/images/screens_image/statistics.jpeg',
                  fit: BoxFit.cover,
                  opacity: AlwaysStoppedAnimation(0.3),
                ),
              ),
            if (_selectedIndex == 4)
              Expanded(
                child: Image.asset(
                  'assets/images/screens_image/advices.jpeg',
                  fit: BoxFit.cover,
                  opacity: AlwaysStoppedAnimation(0.3),
                ),
              ),
            if (_selectedIndex == 5)
              Expanded(
                child: Image.asset(
                  'assets/images/screens_image/settings.jpeg',
                  fit: BoxFit.cover,
                  opacity: AlwaysStoppedAnimation(0.3),
                ),
              )
          ]),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() {
              _selectedIndex = index;
            }),
            type: BottomNavigationBarType.shifting,
            enableFeedback: true,
            unselectedItemColor: Color.fromRGBO(128, 158, 158, 1),
            selectedItemColor: Color.fromRGBO(94, 157, 53, 1),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Рецепты',
                icon: SvgPicture.asset('assets/icons/navbar/recipes.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/navbar/recipes.svg',
                  colorFilter: ColorFilter.mode(Color.fromRGBO(94, 157, 53, 1), BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Меню',
                icon: SvgPicture.asset('assets/icons/navbar/menu.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/navbar/menu.svg',
                  colorFilter: ColorFilter.mode(Color.fromRGBO(94, 157, 53, 1), BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Покупки',
                icon: SvgPicture.asset('assets/icons/navbar/purchases.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/navbar/purchases.svg',
                  colorFilter: ColorFilter.mode(Color.fromRGBO(94, 157, 53, 1), BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Статистика',
                icon: SvgPicture.asset('assets/icons/navbar/statistics.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/navbar/statistics.svg',
                  colorFilter: ColorFilter.mode(Color.fromRGBO(94, 157, 53, 1), BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Советы',
                icon: SvgPicture.asset('assets/icons/navbar/advices.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/navbar/advices.svg',
                  colorFilter: ColorFilter.mode(Color.fromRGBO(94, 157, 53, 1), BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Настройки',
                icon: SvgPicture.asset('assets/icons/navbar/settings.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/navbar/settings.svg',
                  colorFilter: ColorFilter.mode(Color.fromRGBO(94, 157, 53, 1), BlendMode.srcIn),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: screens[_selectedIndex],
        ));
  }
}
