import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isSelectDay = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 50.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(226, 243, 216, 1),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomButton(
                            height: 30,
                            child: Text('День'),
                            textColor: isSelectDay ? Colors.white : greenColor,
                            color: isSelectDay
                                ? greenColor
                                : Color.fromRGBO(226, 243, 216, 1),
                            borderRadius: BorderRadius.circular(10),
                            onPressed: () {
                              setState(() {
                                if (!isSelectDay) {
                                  isSelectDay = !isSelectDay;
                                }
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: CustomButton(
                            height: 30,
                            child: Text('Неделя'),
                            textColor: !isSelectDay ? Colors.white : greenColor,
                            color: !isSelectDay
                                ? greenColor
                                : Color.fromRGBO(226, 243, 216, 1),
                            borderRadius: BorderRadius.circular(10),
                            onPressed: () {
                              setState(() {
                                if (isSelectDay) {
                                  isSelectDay = !isSelectDay;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 24),
                  child: CustomButton(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset('assets/icons/add_ingredients.svg'),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/add_plan_menu'),
                  ),
                )
              ],
            ),
          ),
          recipesBox.length != 0
              ? ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container();
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/screens_isEmpty/menu.png',
                        fit: BoxFit.contain,
                      ),
                      Text(
                        'Вы еще не сохранили меню',
                        style: TextStyle(
                            fontFamily: 'Source_Sans',
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(98, 132, 132, 1)),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
