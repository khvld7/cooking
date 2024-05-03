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
  State<AddPlanMenu> createState() => _AddPlanMenuState();
}

class _AddPlanMenuState extends State<AddPlanMenu> {
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
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                AddPlanCustom(
                  controller: controller,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: addPlan,
            ),
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
                      setState(
                        () {
                          addPlan.add(
                            AddPlanCustom(
                              id: addPlan.length + 2,
                              controller: TextEditingController(),
                            ),
                          );
                        },
                      );
                    },
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
