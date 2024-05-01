import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/instructions_custom.dart';
import 'package:cooking/components/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddInstructions extends StatefulWidget {
  AddInstructions({super.key});

  @override
  State<AddInstructions> createState() => _AddInstructionsState();
}

class _AddInstructionsState extends State<AddInstructions> {
  List<Widget> step = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() => setState(() {}));
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
                'Добавление инструкции',
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              InstructionsCustom(
                controller: controller,
              ),
            ],
          ),
          Column(
            children: step,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        height: 36,
                        child: Text('Добавить шаг'),
                        border: Border.all(color: greenColor),
                        textColor: greenColor,
                        onPressed: () {
                          setState(() {
                            step.add(
                              InstructionsCustom(
                                id: step.length + 2,
                                controller: TextEditingController(),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          isActive: controller.text.isEmpty ? false : true,
                          textColor: controller.text.isEmpty
                              ? Color.fromRGBO(128, 158, 158, 1)
                              : Colors.white,
                          color: controller.text.isEmpty
                              ? Color.fromRGBO(226, 243, 216, 1)
                              : greenColor,
                          child: Text('Сохранить рецепт'),
                          onPressed: () {},
                        ),
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
