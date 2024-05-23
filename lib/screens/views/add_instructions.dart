import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/instructions_custom.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/database/database.dart';
import 'package:cooking/screens/views/add_recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddInstructions extends StatefulWidget {
  AddInstructions({super.key});

  @override
  State<AddInstructions> createState() => _AddInstructionsState();
}

class _AddInstructionsState extends State<AddInstructions> {
  List<InstructionsDB> instructiontsDB = [];
  List<String> categorySelect = [];
  @override
  void initState() {
    super.initState();
    instructiontsDB.clear();
    step[0].controller!.clear();
    step.length = 1;
    step[0].controller!.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
  }

  addInstructions() {
    setState(() {
      step.forEach((element) {
        instructiontsDB.add(
          InstructionsDB(
            id: step[element.id! - 1].id!,
            name: step[element.id! - 1].controller?.text ?? '',
          ),
        );
      });

      recipesBox.values.forEach((recipes) {
        if (nameDishController.text.isEmpty &
            categorySelect.isEmpty &
            aboutController.text.isEmpty &
            tags.isEmpty &
            (person == 0) &
            ingredients[0].controller!.text.isEmpty &
            noteController.text.isEmpty &
            instructiontsDB.isNotEmpty) {
          return;
        } else {
          if (recipes.id == recipesBox.length)
            recipesBox.putAt(
              recipes.id,
              RecipesDB(
                name: recipes.name,
                category: recipes.category,
                about: recipes.about,
                tags: recipes.tags,
                mark: recipes.mark,
                person: recipes.person,
                ingredients: recipes.ingredients,
                instructions: instructiontsDB,
                note: recipes.note,
              ),
            );
        }
      });
    });
  }

  @override
  void dispose() {
    step[0].controller!.removeListener(() {});
    super.dispose();
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
                        borderRadius: BorderRadius.circular(6),
                        height: 36,
                        child: Text('Добавить шаг'),
                        border: Border.all(color: greenColor),
                        textColor: greenColor,
                        onPressed: () {
                          setState(() {
                            step.add(
                              InstructionsCustom(
                                id: step.length + 1,
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
                          borderRadius: BorderRadius.circular(6),
                          isActive: step[0].controller!.text.isEmpty ? false : true,
                          textColor: step[0].controller!.text.isEmpty ? Color.fromRGBO(128, 158, 158, 1) : Colors.white,
                          color: step[0].controller!.text.isEmpty ? Color.fromRGBO(226, 243, 216, 1) : greenColor,
                          child: Text('Сохранить рецепт'),
                          onPressed: () {
                            nameDishController.text.isEmpty &
                                    categorySelect.isEmpty &
                                    aboutController.text.isEmpty &
                                    tags.isEmpty &
                                    (person == 0) &
                                    ingredients[0].controller!.text.isEmpty &
                                    noteController.text.isEmpty &
                                    step[0].controller!.text.isNotEmpty
                                ? Navigator.pop(context)
                                : (
                                    {
                                      addInstructions(),
                                      Navigator.pop(context, instructiontsDB),
                                    },
                                  );
                          },
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
