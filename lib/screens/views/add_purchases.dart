import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/ingredients_custom.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/database/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class AddPurchases extends StatefulWidget {
  const AddPurchases({super.key});

  @override
  State<AddPurchases> createState() => _AddPurchasesState();
}

class _AddPurchasesState extends State<AddPurchases> {
  _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: MediaQuery.of(context).size.height / 3,
        padding: EdgeInsets.only(
          top: 6,
        ),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  TextEditingController controller = TextEditingController();
  late String dateText;
  var formatterDateNow;
  var formatter = DateFormat('dd.MM.yyyy');
  late DateTime date;

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
                                _showDialog(
                                  CupertinoDatePicker(
                                    dateOrder: DatePickerDateOrder.mdy,
                                    initialDateTime: DateTime.now(),
                                    mode: CupertinoDatePickerMode.date,
                                    use24hFormat: true,
                                    onDateTimeChanged: (DateTime newDate) {
                                      setState(
                                        () => dateText =
                                            formatter.format(newDate),
                                      );
                                    },
                                  ),
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
