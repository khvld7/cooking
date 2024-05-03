import 'package:cooking/components/count_button.dart';
import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/custom_textfield.dart';
import 'package:cooking/components/ingredients_custom.dart';
import 'package:cooking/database/database.dart';
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

class _AddRecipesState extends State<AddRecipes> {
  TextEditingController nameDishController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  int person = 0;
  String dropDownValue = items.first;

  @override
  void initState() {
    nameDishController.addListener(() => setState(() {}));
    aboutController.addListener(() => setState(() {}));
    tagsController.addListener(() => setState(() {}));
    ingredientsController.addListener(() => setState(() {}));
    noteController.addListener(() => setState(() {}));
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
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              category.forEach((element) {
                                element.isSelect = false;
                              });
                              category[index].isSelect = true;
                            });
                          },
                          child: category[index].build(context),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: tags,
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
                      onSubmitted: (value) {
                        if (value != '') {
                          setState(() {
                            tagsController.text;
                            tags.add(
                              TagsCustom(
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
                          colorFilter:
                              ColorFilter.mode(Colors.yellow, BlendMode.srcIn),
                        ),
                        onRatingUpdate: (value) {},
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
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
                Container(
                  margin: EdgeInsets.only(top: 5),
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
                  child: Column(
                    children: [
                      IngredientsCustom(
                        controller: ingredientsController,
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
                                id: ingredients.length + 2,
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
                            style: TextStyle(
                                color: greenColor,
                                decoration: TextDecoration.underline),
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
                                tagsController.text.isEmpty ||
                                ingredientsController.text.isEmpty ||
                                person == 0
                            ? false
                            : true,
                        textColor: nameDishController.text.isEmpty ||
                                aboutController.text.isEmpty ||
                                tagsController.text.isEmpty ||
                                ingredientsController.text.isEmpty ||
                                person == 0
                            ? Color.fromRGBO(128, 158, 158, 1)
                            : Colors.white,
                        color: nameDishController.text.isEmpty ||
                                aboutController.text.isEmpty ||
                                tagsController.text.isEmpty ||
                                ingredientsController.text.isEmpty ||
                                person == 0
                            ? Color.fromRGBO(226, 243, 216, 1)
                            : greenColor,
                        child: Text('Сохранить рецепт'),
                        onPressed: () {},
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
                      onPressed: () =>
                          Navigator.pushNamed(context, '/add_instructions'),
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
