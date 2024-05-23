import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/components/calendar_custom.dart';
import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/ingredients_custom.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class AddPurchases extends StatefulWidget {
  const AddPurchases({super.key});

  @override
  State<AddPurchases> createState() => _AddPurchasesState();
}

String? dateText;
var formatterDateNow;
var formatteDateMonth;
var formatter = DateFormat('dd.MM.yyyy');
late DateTime date;

String? selectDate;

class _AddPurchasesState extends State<AddPurchases> {List<String> categorySelect = [];
List<IngredientsDB> ingredientsDB = [];
List<InstructionsDB> instructiontsDB = [];
  @override
  void initState() {
    selectDate = 'Дата';
    ingredientsDB.clear();
    ingredients.length = 1;
    ingredients[0].controller?.clear();
    ingredients[0].controller!.addListener(() {
      if (!mounted) return;
      setState(() {});
    });

    date = DateTime.now();
    formatterDateNow = DateFormat('dd.MM.yyyy').format(date);
    dateText = formatterDateNow.toString();
    super.initState();
  }

  @override
  void dispose() {
    ingredients[0].controller!.removeListener(() {});
    super.dispose();
  }

  addIngredients() {
    ingredients.forEach((element) {
      ingredientsDB.add(
        IngredientsDB(
          id: ingredients[element.id! - 1].id,
          name: ingredients[element.id! - 1].controller?.text,
          count: ingredients[element.id! - 1].count,
          gramm: ingredients[element.id! - 1].gramm!,
        ),
      );
    });
  }

  addPurchases() {
    addIngredients();
    purchasesBox.add(PurchasesDB(
      ingredients: ingredientsDB,
      date: selectDate,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 24),
          child: RawMaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => Navigator.pop(context),
            child: SvgPicture.asset('assets/icons/back_button.svg'),
          ),
        ),
        toolbarHeight: 70,
        bottom: PreferredSize(preferredSize: Size.fromHeight(0.4), child: Divider(height: 0.4, color: greenColor)),
        titleTextStyle: textStyleViewsAppBar,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text('Новый список'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                borderRadius: BorderRadius.circular(6),
                onPressed: () {
                  addPurchases();
                  Navigator.pop(context);
                },
                child: Text('Сохранить'),
                textColor: ingredients[0].controller!.text.isEmpty || selectDate == 'Дата' || ingredients[0].count == 0
                    ? Color.fromRGBO(128, 158, 158, 1)
                    : Colors.white,
                color: ingredients[0].controller!.text.isEmpty || selectDate == 'Дата' || ingredients[0].count == 0
                    ? Color.fromRGBO(226, 243, 216, 1)
                    : greenColor,
                isActive: ingredients[0].controller!.text.isEmpty || selectDate == 'Дата' || ingredients[0].count == 0 ? false : true,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 20, bottom: 80),
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$selectDate',
                              style: TextStyle(
                                fontSize: selectDate == 'Дата' ? 13 : 15,
                                fontWeight: selectDate == 'Дата' ? FontWeight.w300 : FontWeight.w400,
                                fontFamily: 'Source_Sans',
                                color: selectDate == 'Дата' ? Color.fromRGBO(98, 132, 132, 1) : Color.fromRGBO(64, 89, 89, 1),
                              ),
                            ),
                            CustomButton(
                              width: 24,
                              height: 24,
                              child: SvgPicture.asset('assets/icons/calendar.svg'),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      surfaceTintColor: Colors.white,
                                      contentPadding: EdgeInsets.all(5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      actions: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomButton(
                                                height: 35,
                                                textColor: greenColor,
                                                border: Border.all(color: greenColor),
                                                borderRadius: BorderRadius.circular(6),
                                                child: Text('Закрыть'),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 12),
                                            ),
                                            Expanded(
                                              child: CustomButton(
                                                height: 35,
                                                textColor: Colors.white,
                                                color: greenColor,
                                                borderRadius: BorderRadius.circular(6),
                                                child: Text('Выбрать'),
                                                onPressed: () {
                                                  setState(() {
                                                    selectDate = dateText;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                      content: CalendarCustom(),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: greenColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: ingredients,
                        ),
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
