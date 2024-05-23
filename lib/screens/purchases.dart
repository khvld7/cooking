import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/ingredients_custom.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Purchases extends StatefulWidget {
  const Purchases({super.key});

  @override
  State<Purchases> createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: purchasesBox.length != 0
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      borderRadius: BorderRadius.circular(6),
                      onPressed: () => Navigator.pushNamed(context, '/add_purchases').then((value) => setState(() {})),
                      child: Text('Добавить список'),
                      textColor: Colors.white,
                      color: greenColor,
                      isActive: true,
                    ),
                  ),
                ],
              ),
            )
          : SizedBox.shrink(),
      body: purchasesBox.length != 0
          ? ListView.builder(
              padding: EdgeInsets.only(top: 20, bottom: 60),
              physics: BouncingScrollPhysics(),
              itemCount: purchasesBox.length,
              itemBuilder: (BuildContext context, int index) {
                final purchasesIndex = purchasesBox.getAt(index);
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
                  child: ExpansionTile(
                    shape: Border.all(style: BorderStyle.none),
                    onExpansionChanged: (value) {
                      setState(() {
                        purchasesIndex.isOpen = !purchasesIndex.isOpen!;
                      });
                    },
                    trailing: SvgPicture.asset(purchasesIndex!.isOpen! ? 'assets/icons/open_purchase.svg' : 'assets/icons/close_purchase.svg'),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    title: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/calendar.svg'),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 7.5),
                                  child: Text(
                                    purchasesIndex.date ?? '',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Soucre_Sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    children: [
                      Divider(
                        height: 1,
                        color: greenColor,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Ингредиенты',
                                    style: textstyleHeader,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemExtent: 30,
                                itemCount: purchasesIndex.ingredients?.length,
                                physics: ScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${purchasesIndex.ingredients?[index].id}. ',
                                          style: textstyleHeader,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                                            child: Stack(
                                              children: [
                                                purchasesIndex.ingredients![index].isSelect!
                                                    ? Divider(
                                                        height: 17.5,
                                                        color: greenColor,
                                                      )
                                                    : SizedBox.shrink(),
                                                RichText(
                                                  text: TextSpan(
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: 'Soucre_Sans',
                                                      color: Color.fromRGBO(98, 132, 132, 1),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '${purchasesIndex.ingredients?[index].name} ',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: 'Soucre_Sans',
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      WidgetSpan(
                                                        child: Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 5),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '${purchasesIndex.ingredients?[index].count} ',
                                                      ),
                                                      TextSpan(
                                                        text: '${purchasesIndex.ingredients?[index].gramm} ',
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        CustomButton(
                                          width: 24,
                                          height: 24,
                                          onPressed: () {
                                            setState(() {
                                              purchasesIndex.ingredients?[index].isSelect = !purchasesIndex.ingredients![index].isSelect!;
                                            });
                                          },
                                          child: SvgPicture.asset(purchasesIndex.ingredients![index].isSelect!
                                              ? 'assets/icons/active/checkbox_active.svg'
                                              : 'assets/icons/checkbox.svg'),
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
                      Divider(
                        height: 1,
                        color: greenColor,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomButton(
                                height: 35,
                                border: Border.all(color: greenColor),
                                borderRadius: BorderRadius.circular(6),
                                child: Text('Добавить ингредиент'),
                                textColor: greenColor,
                                onPressed: () {
                                  ingredients[0].controller?.clear();
                                  ingredients.length = 1;
                                  showDialog(
                                    context: context,
                                    builder: (_) => StatefulBuilder(
                                      builder: (BuildContext context, void Function(void Function()) setState) {
                                        return AlertDialog(
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
                                                  textColor: Colors.white,
                                                  onPressed: () {
                                                    setState(() {
                                                      ingredients.forEach((element) {
                                                        ingredients[0].controller!.text.isNotEmpty && ingredients[0].count != 0
                                                            ? purchasesIndex.ingredients?.add(
                                                                IngredientsDB(
                                                                  id: ingredients.length == 1
                                                                      ? purchasesIndex.ingredients!.last.id! + ingredients[element.id! - 1].id!
                                                                      : purchasesIndex.ingredients!.last.id! + 1,
                                                                  name: ingredients[element.id! - 1].controller?.text ?? '',
                                                                  count: ingredients[element.id! - 1].count,
                                                                  gramm: ingredients[element.id! - 1].gramm!,
                                                                ),
                                                              )
                                                            : null;
                                                        purchasesBox.putAt(
                                                          index,
                                                          PurchasesDB(date: purchasesIndex.date, ingredients: purchasesIndex.ingredients),
                                                        );
                                                      });
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Выбрать',
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
                                          content: Container(
                                            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                                            height: MediaQuery.sizeOf(context).height / 3,
                                            width: MediaQuery.sizeOf(context).height / 3,
                                            child: ListView(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Добавление ингредиента',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: 'Source_Sans',
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                                      child: Column(
                                                        children: [
                                                          Column(
                                                            children: ingredients,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                                              CustomButton(
                                                                onPressed: () {
                                                                  setState(
                                                                    () {
                                                                      ingredients.add(
                                                                        IngredientsCustom(
                                                                          id: ingredients.length + 1,
                                                                          controller: TextEditingController(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                    SvgPicture.asset('assets/icons/add_ingredients.svg'),
                                                                    Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                                                                    Text(
                                                                      'Добавить ингредиент',
                                                                      style: TextStyle(color: greenColor, decoration: TextDecoration.underline),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ).then((value) => setState(() {}));
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/screens_isEmpty/purchases.png',
                    fit: BoxFit.contain,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Список покупок пуст. ',
                        style: TextStyle(
                          fontFamily: 'Source_Sans',
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(98, 132, 132, 1),
                        ),
                      ),
                      CustomButton(
                        child: Text(
                          'Пополнить сейчас',
                          style: TextStyle(
                            fontFamily: 'Source_Sans',
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: greenColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/add_purchases').then((value) => setState(() {}));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
