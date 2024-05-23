import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/components/add_plan_custom.dart';
import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/database/database.dart';
import 'package:cooking/screens/views/add_purchases.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPlanMenu extends StatefulWidget {
  AddPlanMenu({super.key});

  @override
  State<AddPlanMenu> createState() => AddPlanMenuState();
}

class AddPlanMenuState extends State<AddPlanMenu> {
  bool isActive = false;

  @override
  void initState() {
    addPlan.length = 1;
    addPlan[0].controller!.clear();
    addPlan[0].controller!.addListener(() {
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
    addPlan[0].controller!.removeListener(() {});
    super.dispose();
  }

  addMenu() {
    List<DayMenuDB> days = [];
    addPlan.forEach((element) {
      days.add(
        DayMenuDB(
          id: element.id,
          date: element.date,
          text: element.controller!.text,
          recipes: element.recipes,
        ),
      );
    });

    menuBox.add(
      MenuDB(
        isWeek: days.length > 1,
        days: days,
      ),
    );
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
              child: Text(
                'Планирование Меню',
              ),
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
                  addMenu();
                  Navigator.pop(context);
                },
                child: Text('Сохранить'),
                isActive: addPlan.every(
                  (element) {
                    if (isActive = element.controller!.text.isEmpty || element.recipes!.isEmpty || element.date == 'Дата') {
                      isActive = false;
                      return false;
                    } else {
                      isActive = true;
                      return true;
                    }
                  },
                ),
                textColor: isActive ? Colors.white : Color.fromRGBO(128, 158, 158, 1),
                color: isActive ? greenColor : Color.fromRGBO(226, 243, 216, 1),
              ),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height / 7),
          children: [
            ListView.builder(
              itemCount: addPlan.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 20, bottom: 0, left: 24, right: 24),
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return addPlan[index];
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      height: 40,
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                      border: Border.all(color: greenColor),
                      textColor: greenColor,
                      child: Text('Добавить шаг'),
                      onPressed: () {
                        setState(() {
                          if (addPlan.last.controller!.text.isNotEmpty && addPlan.last.date != 'Дата' && addPlan.last.chooseRecipes!.isNotEmpty) {
                            addPlan.add(
                              AddPlanCustom(
                                id: addPlan.length,
                                controller: TextEditingController(),
                              ),
                            );
                          }
                          return;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
