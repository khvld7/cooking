import 'package:cooking/components/category_custom.dart';
import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/database/database.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  Map<int, int> countCategory = {
    0: 0,
    1: 0,
    2: 0,
    3: 0,
    4: 0,
    5: 0,
    6: 0,
    7: 0,
    8: 0,
    9: 0,
  };

  int countDay = 0;
  int countWeek = 0;

  score() {
    recipesBox.values.forEach((element) {
      countCategory[element.category] = countCategory.update(element.category, (value) => value + 1);
    });
    for (var i = 0; i < 10; i++) {
      if (countCategory[i] == 0) {
        countCategory.remove(i);
      } else {}
    }
    
    menuBox.values.forEach(
      (element) {
        element.isWeek ? countWeek += 1 : countDay += 1;
      },
    );
    
  }

  @override
  void initState() {
    score();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            margin: EdgeInsets.symmetric(vertical: 10),
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
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Всего рецептов',
                        style: textstyleHeader,
                      ),
                    ),
                    Text(
                      '${recipesBox.length}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Source_Sans',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Divider(
                    height: 1,
                    color: greenColor,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'По категориям',
                        style: textstyleHeader,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: countCategory.length,
                    shrinkWrap: true,
                    itemExtent: 36,
                    itemBuilder: (BuildContext context, int index) {
                      int keyIndex = countCategory.entries.elementAt(index).key;
                      return Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CategoryCustom(
                              text: recipesCategory[keyIndex].text,
                              image: recipesCategory[keyIndex].image,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text('${countCategory[keyIndex]}'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            margin: EdgeInsets.symmetric(vertical: 10),
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
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Составлено меню',
                        style: textstyleHeader,
                      ),
                    ),
                    Text(
                      '${menuBox.length}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Source_Sans',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Divider(
                    height: 1,
                    color: greenColor,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'По категориям',
                        style: textstyleHeader,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'На день',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Source_Sans',
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.end,
                            'На неделю',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Source_Sans',
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${countDay}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Source_Sans',
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.end,
                              '${countWeek}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Source_Sans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                    child: CustomButton(
                  height: 40,
                  borderRadius: BorderRadius.circular(6),
                  child: Text('Очистить статистику'),
                  textColor: Colors.white,
                  color: greenColor,
                  onPressed: () => showDialog(
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
                              color: greenColor,
                              onPressed: () async {
                                await menuBox.clear();
                                await recipesBox.clear();
                                countCategory.clear();
                                countDay = 0;
                                countWeek = 0;
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Очистить',
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
                              'Очистка статистики',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Source_Sans',
                                color: greenColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Вы действительно хотите очистить статистику?',
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
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
