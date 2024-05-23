import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/globals.dart';
import 'package:cooking/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void nextScreen() {
    if (active_screen_id < 2) {
      active_screen_id += 1;
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(
            '/screens',
            (Route<dynamic> route) => false,
          )
          .then((value) => setState(() {}));
    }
  }

  int active_screen_id = 0;

  List<Onboarding> screenData = [
    Onboarding(
      screenId: 0,
      title: 'Рецепты',
      text: 'Ваши любимые рецепты и смелые эксперименты всегда под рукой.',
    ),
    Onboarding(
      screenId: 1,
      title: 'Меню',
      text: 'Составляйте меню для одного дня, целой недели или праздничного события.',
    ),
    Onboarding(
      screenId: 2,
      title: 'Список покупок',
      text: 'Не теряйте список покупок и отмечайте все, что уже в корзине.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/onboarding_screen_$active_screen_id.jpeg',
              width: double.infinity,
              fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).size.height / 2,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.normal,
                    blurRadius: 5,
                    color: Color.fromARGB(255, 230, 230, 230),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    screenData[active_screen_id].title!,
                    style: textStyleAppBar,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5, right: 10, bottom: 20),
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                        ),
                        Expanded(
                          child: Text(
                            screenData[active_screen_id].text!,
                            style: TextStyle(
                              fontFamily: 'Source_Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: active_screen_id == 0
                            ? SvgPicture.asset('assets/icons/active/radiobutton_active.svg')
                            : SvgPicture.asset('assets/icons/radiobutton.svg'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: active_screen_id == 1
                            ? SvgPicture.asset('assets/icons/active/radiobutton_active.svg')
                            : SvgPicture.asset('assets/icons/radiobutton.svg'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: active_screen_id == 2
                            ? SvgPicture.asset('assets/icons/active/radiobutton_active.svg')
                            : SvgPicture.asset('assets/icons/radiobutton.svg'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox.shrink()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomButton(
                          borderRadius: BorderRadius.circular(6),
                          onPressed: () {
                            setState(() {
                              if (active_screen_id == 0 || active_screen_id == 1) {
                                active_screen_id = 2;
                              } else {
                                nextScreen();
                              }
                            });
                          },
                          height: 40,
                          child: Text(
                            'Пропустить',
                            style: TextStyle(
                              color: Color.fromRGBO(94, 157, 53, 1),
                            ),
                          ),
                          border: Border.all(
                            color: Color.fromRGBO(94, 157, 53, 1),
                          ),
                          isActive: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                      Expanded(
                        child: CustomButton(
                          borderRadius: BorderRadius.circular(6),
                          height: 40,
                          onPressed: () {
                            setState(() {
                              nextScreen();
                            });
                          },
                          child: Text(
                            'Далее',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Color.fromRGBO(94, 157, 53, 1),
                          isActive: true,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RawMaterialButton(
                              onPressed: launchURL,
                              child: Text(
                                'Условия использования ',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Source_Sans',
                                  color: Color.fromRGBO(98, 132, 132, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(color: Color.fromRGBO(94, 157, 53, 1)),
                        width: 1,
                        height: 15,
                      ),
                      Expanded(
                        child: RawMaterialButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: launchURL,
                          child: Text(
                            ' Политика конфиденциальности',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w300, fontFamily: 'Source_Sans', color: Color.fromRGBO(98, 132, 132, 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 15))
          ],
        ),
      ),
    );
  }
}
