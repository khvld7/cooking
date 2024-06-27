import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/components/custom_button.dart';
import 'package:cooking/screens/views/add_recipes.dart';
import 'package:cooking/screens/views/recipe_details.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/database/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  TextEditingController searchController = TextEditingController();
  searchRecepies() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filtred = recipesBox.values.where((element) {
        return element.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filtred = recipesBox.values.toList();
      changeCategory(0);
      recipesCategory.forEach((element) {
        element.isSelect = false;
        recipesCategory[0].isSelect = true;
      });
    }
    setState(() {});
  }

  changeCategory(int category) {
    filtred.clear();

    if (category != 0) {
      recipesBox.values.forEach(
        (element) {
          if (element.category == category) {
            filtred.add(element);
          }
          if (category == 1) {
            if (element.favourites == true) {
              filtred.add(element);
            }
          }
        },
      );
    } else {
      filtred = recipesBox.values.toList();
    }
    setState(() {});
  }

  List<RecipesDB> filtred = [];

  @override
  void initState() {
    filtred.clear();
    searchController.addListener(searchRecepies);
    changeCategory(0);
    recipesCategory.forEach((element) {
      element.isSelect = false;
      recipesCategory[0].isSelect = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: recipesBox.length != 0
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 36,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                    child: TextFormField(
                      controller: searchController,
                      style: textStyleAdvices,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(244, 244, 244, 1),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SvgPicture.asset('assets/icons/search.svg'),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(6)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(98, 132, 132, 1),
                          fontSize: 13,
                          fontFamily: 'Source_Sans',
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.7,
                        ),
                        hintText: 'Искать...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 24),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    child: ListView.builder(
                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                      scrollDirection: Axis.horizontal,
                      itemCount: recipesCategory.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              recipesCategory.forEach((element) {
                                element.isSelect = false;
                              });
                              recipesCategory[index].isSelect = true;
                            });
                            changeCategory(recipesCategory[index].id!);
                          },
                          child: recipesCategory[index].build(context),
                        );
                      },
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: recipesBox.listenable(),
                    builder: (context, Box<RecipesDB> recipesBox, _) {
                      return ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 20, bottom: 60),
                        physics: BouncingScrollPhysics(),
                        itemCount: filtred.length,
                        itemBuilder: (BuildContext context, int index) {
                          final recepIndex = recipesBox.getAt(index)!;
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetails(
                                    name: recepIndex.name,
                                    person: recepIndex.person,
                                    about: recepIndex.about,
                                    marks: recepIndex.mark,
                                    ingredientsDB: recepIndex.ingredients,
                                    instructionsDB: recepIndex.instructions,
                                    note: recepIndex.note,
                                  ),
                                ),
                              ).then((value) => setState(() {}));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
                              child: Stack(
                                alignment: AlignmentDirectional(0.5, -1.75),
                                children: [
                                  CustomButton(
                                      borderRadius: BorderRadius.circular(6),
                                      height: 30,
                                      color: greenColor,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            recipesCategory[filtred[index].category].image!,
                                            width: 20,
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 5),
                                          ),
                                          Text(
                                            recipesCategory[filtred[index].category].text,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Source_Sans',
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 5),
                                        child: Row(
                                          children: [
                                            CustomButton(
                                              width: 24,
                                              height: 24,
                                              child: SvgPicture.asset(
                                                filtred[index].favourites ? 'assets/icons/mark_app.svg' : 'assets/icons/active/mark_app_active.svg',
                                                fit: BoxFit.fill,
                                                colorFilter: ColorFilter.mode(
                                                  filtred[index].favourites ? greenColor : Colors.grey,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  filtred[index].favourites = !filtred[index].favourites;
                                                });
                                              },
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 12),
                                                child: Text(
                                                  filtred[index].name,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 12),
                                              child: PopupMenuButton(
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                                color: Colors.white,
                                                child: SvgPicture.asset(
                                                  'assets/icons/dots.svg',
                                                ),
                                                itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                    onTap: () {
                                                      setState(() {
                                                        recepIndex.favourites = true;
                                                      });
                                                    },
                                                    height: 30,
                                                    child: Text(
                                                      'В избранное',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: 'Source_Sans',
                                                        color: Color.fromRGBO(64, 89, 89, 1),
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10,
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    height: 30,
                                                    child: Text(
                                                      'Редактировать',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: 'Source_Sans',
                                                        color: Color.fromRGBO(64, 89, 89, 1),
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10,
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (_) => AlertDialog(
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
                                                                  color: Colors.red,
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      filtred.removeAt(index);
                                                                      recipesBox.values.forEach((element) {
                                                                        if (element == filtred[index]) {
                                                                          element.delete();
                                                                        }
                                                                      });
                                                                    });
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Text(
                                                                    'Удалить',
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
                                                          title: Container(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  'Удалить',
                                                                  style: TextStyle(
                                                                    fontSize: 24,
                                                                    fontWeight: FontWeight.w400,
                                                                    fontFamily: 'Source_Sans',
                                                                    color: Colors.red,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(top: 10),
                                                                  child: Text(
                                                                    'Вы действительно хотите удалить рецепт?',
                                                                    style: TextStyle(
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w400,
                                                                      fontFamily: 'Source_Sans',
                                                                      color: Color.fromRGBO(64, 89, 89, 1),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    height: 30,
                                                    child: Text(
                                                      'Удалить',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: 'Source_Sans',
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 12, bottom: 10),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                filtred[index].tags,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Mosterrat',
                                                  fontWeight: FontWeight.w300,
                                                  color: greenColor,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/screens_isEmpty/recipes.png',
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'Ваш список рецептов пуст',
                    style: TextStyle(fontFamily: 'Source_Sans', fontSize: 13, fontWeight: FontWeight.w300, color: Color.fromRGBO(98, 132, 132, 1)),
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
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return AddRecipes();
                      },
                    ),
                  );
                  setState(() {
                    changeCategory(0);
                    recipesCategory.forEach((element) {
                      element.isSelect = false;
                      recipesCategory[0].isSelect = true;
                    });
                  });
                },
                child: Text('Добавить рецепт'),
                textColor: Colors.white,
                color: greenColor,
                isActive: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
