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

class _AddPurchasesState extends State<AddPurchases> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    date = DateTime.now();
    formatterDateNow = DateFormat('dd.MM.yyyy').format(date);
    dateText = formatterDateNow.toString();
    super.initState();
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
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.4),
            child: Divider(height: 0.4, color: greenColor)),
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
                onPressed: () => Navigator.pop(context),
                child: Text('Сохранить'),
                textColor: controller.text.isEmpty
                    ? Color.fromRGBO(128, 158, 158, 1)
                    : Colors.white,
                color: controller.text.isEmpty
                    ? Color.fromRGBO(226, 243, 216, 1)
                    : greenColor,
                isActive: controller.text.isEmpty ? false : true,
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('$dateText'),
                            CustomButton(
                              width: 24,
                              height: 24,
                              child:
                                  SvgPicture.asset('assets/icons/calendar.svg'),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
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
                                                border: Border.all(
                                                    color: greenColor),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child: Text('Закрыть'),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                            ),
                                            Expanded(
                                              child: CustomButton(
                                                height: 35,
                                                textColor: Colors.white,
                                                color: greenColor,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child: Text('Выбрать'),
                                                onPressed: () {
                                                  setState(() {});
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
                        padding: EdgeInsets.only(top: 10),
                        child: IngredientsCustom(
                          controller: controller,
                        ),
                      ),
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
                                      id: ingredients.length + 2,
                                      controller: TextEditingController(),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/add_ingredients.svg'),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3)),
                                Text(
                                  'Добавить ингредиент',
                                  style: TextStyle(
                                      color: greenColor,
                                      decoration: TextDecoration.underline),
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
