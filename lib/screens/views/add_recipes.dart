import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/components/count_button.dart';
import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/custom_textfield.dart';
import 'package:cooking/components/ingredients_custom.dart';
import 'package:cooking/database/database.dart';
import 'package:cooking/screens/statistics.dart';
import 'package:cooking/screens/views/add_instructions.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/components/tags_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddRecipes extends StatefulWidget {
  AddRecipes({super.key});

  @override
  State<AddRecipes> createState() => _AddRecipesState();
}

TextEditingController nameDishController = TextEditingController();
TextEditingController aboutController = TextEditingController();
TextEditingController tagsController = TextEditingController();
TextEditingController noteController = TextEditingController();
int person = 0;
int rate = 0;

class _AddRecipesState extends State<AddRecipes> {
  int activeCategory = 0;
  List<IngredientsDB> ingredientsDB = [];
  List<InstructionsDB> instructionsDB = [];

  String dropDownValue = items.first;

  @override
  void initState() {
    super.initState();
    recipesCategory.forEach((element) {
      element.isSelect = false;
    });
    nameDishController.clear();
    aboutController.clear();
    noteController.clear();
    tags.clear();
    person = 0;
    ingredientsDB.clear();
    ingredients[0].controller!.clear();
    ingredients[0].controller!.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
    ingredients.length = 1;
    nameDishController.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
    aboutController.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
    tagsController.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
    noteController.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
  }

  addIngredients() {
    setState(() {
      ingredients.forEach((element) {
        ingredientsDB.add(
          IngredientsDB(
            id: ingredients[element.id! - 1].id,
            name: ingredients[element.id! - 1].controller?.text ?? '',
            count: ingredients[element.id! - 1].count,
            gramm: ingredients[element.id! - 1].gramm!,
          ),
        );
      });
    });
  }

  addRecipes() {
    List<String> tagsText = [];

    setState(() {
      tags.forEach((element) {
        tagsText.add(element.text!);
      });

      addIngredients();

      recipesBox.add(
        RecipesDB(
          id: recipesBox.length,
          name: nameDishController.text,
          category: activeCategory,
          about: aboutController.text,
          tags: tagsText.join(' '),
          mark: rate,
          person: person,
          ingredients: ingredientsDB,
          instructions: instructionsDB,
          note: noteController.text,
        ),
      );
    });
  }

  @override
  void dispose() {
    nameDishController.removeListener(() {});
    aboutController.removeListener(() {});
    ingredients[0].controller!.removeListener(() {});
    tagsController.removeListener(() {});
    noteController.removeListener(() {});
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
                'Добавление рецепта',
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 20),
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Название блюда',
                  style: textStyleAddRecipes,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 2),
                          color: Color.fromRGBO(212, 212, 212, 0.1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(6),
                      color: Color.fromRGBO(241, 241, 241, 1),
                    ),
                    child: CustomTextfield(
                      textCapitalization: TextCapitalization.sentences,
                      controller: nameDishController,
                      onChanged: (value) {
                        value = nameDishController.text;
                      },
                      hintText: 'Название блюда',
                    ),
                  ),
                ),
                Text(
                  'Категория',
                  style: textStyleAddRecipes,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Container(
                    height: 80,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: recipesCategory.length - 2,
                      itemBuilder: (context, index) {
                        return InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              recipesCategory.forEach((element) {
                                element.isSelect = false;
                              });
                              recipesCategory[index + 2].isSelect = true;
                              activeCategory = recipesCategory[index + 2].id!;
                            });
                          },
                          child: recipesCategory[index + 2].build(context),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 95,
                        crossAxisSpacing: 10,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Описание',
                    style: textStyleAddRecipes,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 2),
                          color: Color.fromRGBO(212, 212, 212, 0.1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(6),
                      color: Color.fromRGBO(241, 241, 241, 1),
                    ),
                    child: CustomTextfield(
                      maxLines: null,
                      controller: aboutController,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {
                        value = aboutController.text;
                      },
                      hintText: 'Описание',
                    ),
                  ),
                ),
                Text(
                  'Теги',
                  style: textStyleAddRecipes,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: tags.length == 0 ? 10 : 35,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: tags.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                tags.removeAt(index);
                              });
                            },
                            child: tags[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 2),
                          color: Color.fromRGBO(212, 212, 212, 0.1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(6),
                      color: Color.fromRGBO(241, 241, 241, 1),
                    ),
                    child: CustomTextfield(
                      onSubmitted: (value) {
                        if (value != '' || value.isEmpty) {
                          setState(() {
                            tags.add(
                              TagsCustom(
                                color: Color.fromRGBO(212, 212, 212, 0.1),
                                borderColor: Color.fromRGBO(212, 212, 212, 0.1),
                                text: '#' + value,
                                id: tags.length,
                              ),
                            );
                          });
                          tagsController.clear();
                        } else
                          null;
                      },
                      controller: tagsController,
                      onChanged: (value) {
                        value = tagsController.text;
                      },
                      hintText: '#Тег',
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Оценка',
                          style: textStyleAddRecipes,
                        ),
                      ),
                      RatingBar.builder(
                        glow: false,
                        itemSize: 24,
                        itemBuilder: (context, index) => SvgPicture.asset(
                          'assets/icons/marks.svg',
                          colorFilter: ColorFilter.mode(Colors.yellow, BlendMode.srcIn),
                        ),
                        onRatingUpdate: (value) {
                          rate = value.toInt();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Ингридиенты',
                    style: textStyleAddRecipes,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 2),
                                color: Color.fromRGBO(212, 212, 212, 0.1),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(6),
                            color: Color.fromRGBO(241, 241, 241, 1),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text('Количество персон'),
                                ),
                              ),
                              CountButton(
                                count: person,
                                onPlus: () => setState(() {
                                  person += 1;
                                }),
                                onMinus: () => setState(() {
                                  if (person != 0) person -= 1;
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
                Text(
                  'Заметка',
                  style: textStyleAddRecipes,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 2),
                          color: Color.fromRGBO(212, 212, 212, 0.1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(6),
                      color: Color.fromRGBO(241, 241, 241, 1),
                    ),
                    child: CustomTextfield(
                      maxLines: null,
                      controller: noteController,
                      onChanged: (value) {
                        value = noteController.text;
                      },
                      hintText: 'Заметка',
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        borderRadius: BorderRadius.circular(6),
                        isActive: nameDishController.text.isEmpty ||
                                aboutController.text.isEmpty ||
                                noteController.text.isEmpty ||
                                ingredients[0].controller!.text.isEmpty ||
                                tags.isEmpty ||
                                person == 0
                            ? false
                            : true,
                        textColor: nameDishController.text.isEmpty ||
                                aboutController.text.isEmpty ||
                                noteController.text.isEmpty ||
                                ingredients[0].controller!.text.isEmpty ||
                                tags.isEmpty ||
                                person == 0
                            ? Color.fromRGBO(128, 158, 158, 1)
                            : Colors.white,
                        color: nameDishController.text.isEmpty ||
                                aboutController.text.isEmpty ||
                                noteController.text.isEmpty ||
                                ingredients[0].controller!.text.isEmpty ||
                                tags.isEmpty ||
                                person == 0
                            ? Color.fromRGBO(226, 243, 216, 1)
                            : greenColor,
                        child: Text('Сохранить рецепт'),
                        onPressed: () {
                          setState(() {
                            addRecipes();
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                      borderRadius: BorderRadius.circular(6),
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return AddInstructions();
                            },
                          ),
                        );
                        setState(() {
                          instructionsDB = result;
                        });
                      },
                      border: Border.all(color: greenColor),
                      color: Colors.white,
                      child: Text(
                        'Добавить инструкцию',
                        style: TextStyle(color: greenColor),
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
