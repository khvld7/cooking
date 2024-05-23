import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/database/database.dart';
import 'package:cooking/screens/views/add_plan_menu.dart';
import 'package:cooking/screens/views/add_recipes.dart';
import 'package:cooking/screens/views/menu_details.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<MenuDB> dayOfMenu = [];
  bool isSelectDay = true;

  changeDay(bool selectDay) {
    setState(() {
      dayOfMenu.clear();
      menuBox.values.forEach(
        (element) {
          if (selectDay) {
            if (element.isWeek) {
              dayOfMenu.add(element);
            }
          } else {
            if (!element.isWeek) {
              dayOfMenu.add(element);
            }
          }
        },
      );
    });
    isSelectDay = !isSelectDay;
  }

  @override
  void initState() {
    dayOfMenu.clear();
    changeDay(isSelectDay = false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 0, bottom: 25.0),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Color.fromRGBO(226, 243, 216, 1), borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomButton(
                            height: 30,
                            child: Text('День'),
                            textColor: isSelectDay ? Colors.white : greenColor,
                            color: isSelectDay ? greenColor : Color.fromRGBO(226, 243, 216, 1),
                            borderRadius: BorderRadius.circular(10),
                            onPressed: () {
                              !isSelectDay ? changeDay(isSelectDay) : null;
                            },
                          ),
                        ),
                        Expanded(
                          child: CustomButton(
                            height: 30,
                            child: Text('Неделя'),
                            textColor: !isSelectDay ? Colors.white : greenColor,
                            color: !isSelectDay ? greenColor : Color.fromRGBO(226, 243, 216, 1),
                            borderRadius: BorderRadius.circular(10),
                            onPressed: () {
                              isSelectDay ? changeDay(isSelectDay) : null;
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
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return AddPlanMenu();
                            },
                          ),
                        );
                        changeDay(isSelectDay = false);
                      }),
                )
              ],
            ),
          ),
          dayOfMenu.length != 0
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: dayOfMenu.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    List<DayMenuDB> days = [];
                    if (dayOfMenu[index].days != null) days = dayOfMenu[index].days!;
                    return InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return MenuDetails(days: days);
                            },
                          ),
                        ).then((value) => setState(() {}));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurStyle: BlurStyle.normal,
                              blurRadius: 5,
                              color: Color.fromARGB(255, 230, 230, 230),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                        child: Column(children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/calendar.svg'),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        days.length == 1 ? days.first.date ?? '' : '${days.first.date ?? ''} - ${days.last.date ?? ''}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Soucre_Sans',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child: PopupMenuButton(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                      color: Colors.white,
                                      child: SvgPicture.asset(
                                        'assets/icons/dots.svg',
                                      ),
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                          onTap: () {},
                                          height: 30,
                                          child: Text(
                                            'В избранное',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Source_Sans',
                                              color: Color.fromRGBO(64, 89, 89, 1),
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 10,
                                          ),
                                        ),
                                        PopupMenuItem(
                                          height: 30,
                                          child: Text(
                                            'Редактировать',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Source_Sans',
                                              color: Color.fromRGBO(64, 89, 89, 1),
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 10,
                                          ),
                                        ),
                                        PopupMenuItem(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                                alignment: Alignment.center,
                                                surfaceTintColor: Colors.white,
                                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                                actions: [
                                                  Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      CustomButton(
                                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                                        height: 35,
                                                        textColor: Colors.black,
                                                        border: Border.all(color: greenColor),
                                                        borderRadius: BorderRadius.circular(6),
                                                        onPressed: () => Navigator.pop(context),
                                                        child: Text(
                                                          'Закрыть',
                                                          style: TextStyle(
                                                            fontFamily: 'SF-Pro-Display',
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                            color: greenColor,
                                                          ),
                                                        ),
                                                      ),
                                                      CustomButton(
                                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                                        height: 35,
                                                        borderRadius: BorderRadius.circular(6),
                                                        color: Colors.red,
                                                        onPressed: () {
                                                          setState(() {
                                                            menuBox.deleteAt(index);
                                                            dayOfMenu.removeAt(index);
                                                          });
                                                          Navigator.pop(context);
                                                        },
                                                        child: Text(
                                                          'Удалить',
                                                          style: TextStyle(
                                                            fontFamily: 'SF-Pro-Display',
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                                title: Container(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'Удалить',
                                                        style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: 'Source_Sans',
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 10),
                                                        child: Text(
                                                          'Вы действительно хотите удалить рецепт?',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400,
                                                            fontFamily: 'Source_Sans',
                                                            color: Color.fromRGBO(64, 89, 89, 1),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          height: 30,
                                          child: Text(
                                            'Удалить',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Source_Sans',
                                              color: Colors.red,
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                                child: Text(
                                  days.length == 1 ? days.first.text ?? '' : '${days.first.text ?? ''} - шт; ${days.last.text ?? ''} - шт;',
                                  style: TextStyle(
                                    color: Color.fromRGBO(64, 89, 89, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Source_Sans',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    );
                  },
                )
              : Align(
                  heightFactor: MediaQuery.sizeOf(context).height / 512,
                  child: Column(
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
                          color: Color.fromRGBO(98, 132, 132, 1),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
