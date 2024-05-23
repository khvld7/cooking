import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/components/calendar_custom.dart';
import 'package:cooking/components/choose_custom.dart';
import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/custom_textfield.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/database/database.dart';
import 'package:cooking/screens/views/add_purchases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPlanCustom extends StatefulWidget {
  final int? id;
  final TextEditingController? controller;
  String? date;
  List<ChooseCustom>? chooseRecipes = [];
  List<RecipesDB>? recipes = [];

  AddPlanCustom({
    this.recipes,
    this.chooseRecipes,
    this.date,
    this.controller,
    this.id = 0,
    super.key,
  });
  @override
  State<AddPlanCustom> createState() => AddPlanCustomState();
}

class AddPlanCustomState extends State<AddPlanCustom> {
  TextEditingController searchController = TextEditingController();
  List<RecipesDB> filtred = [];

  void searchRecepies() {
    final query = searchController.text;

    if (query.isNotEmpty) {
      filtred = recipesBox.values.where((element) {
        return element.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filtred = recipesBox.values.toList();
    }
    setState(() {});
  }

  changeCategory(int category) {
    filtred.clear();
    setState(() {
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
      }
    });
  }

  @override
  void initState() {
    changeCategory(1);
    widget.chooseRecipes = [];
    widget.recipes = [];
    widget.date = 'Дата';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.only(top: 20),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'День ${widget.id! + 1}',
                    style: TextStyle(
                      color: greenColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Source_Sans',
                    ),
                  ),
                ),
                Text(
                  '${widget.date}',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Source_Sans',
                    color: Color.fromRGBO(64, 89, 89, 1),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: CustomButton(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset('assets/icons/calendar.svg'),
                    onPressed: () async {
                      await showDialog(
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
                                        onPressed: () async {
                                          setState(() {
                                            widget.date = dateText;
                                          });
                                          Navigator.pop(context);
                                        }),
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
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Divider(
              height: 1,
              color: greenColor,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: CustomTextfield(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 15, left: 20),
                      child: Text(
                        '${widget.id! + 1}. ',
                        style: TextStyle(
                          color: Color.fromRGBO(98, 132, 132, 1),
                          fontSize: 13,
                          fontFamily: 'Source_Sans',
                        ),
                      ),
                    ),
                    maxLines: 1,
                    hintText: 'Прием пищи',
                    onChanged: (value) {
                      value = widget.controller?.text ?? '';
                    },
                    onSubmitted: (value) {
                      setState(() {});
                    },
                    controller: widget.controller,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: widget.chooseRecipes?.length == 0 ? 10 : 100,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: widget.chooseRecipes?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 35,
                          child: RawMaterialButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                widget.recipes?.removeAt(index);
                                widget.chooseRecipes?.removeAt(index);
                              });
                            },
                            child: widget.chooseRecipes?[index],
                          ),
                        );
                      },
                    ),
                  ),
                  CustomButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          recipesCategory.forEach((element) {
                            element.isSelect = false;
                            recipesCategory[1].isSelect = true;
                          });
                          if (!mounted) {
                            searchController.clear();
                          }
                          searchController.addListener(searchRecepies);
                          return StatefulBuilder(builder: (
                            BuildContext context,
                            void Function(void Function()) setState,
                          ) {
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
                                            widget.recipes?.forEach((element) {
                                              if (element.isSelect == true) {
                                                widget.chooseRecipes?.add(
                                                  ChooseCustom(
                                                    id: element.id,
                                                    color: Colors.white,
                                                    text: element.name,
                                                  ),
                                                );
                                              }
                                              element.isSelect = false;
                                            });
                                            filtred.clear();
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              title: Text(
                                'Выберите рецепт',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Source_Sans',
                                ),
                              ),
                              content: Container(
                                height: MediaQuery.sizeOf(context).height / 2.75,
                                width: MediaQuery.sizeOf(context).width,
                                child: Column(
                                  children: [
                                    SingleChildScrollView(
                                      child: Container(
                                        height: 36,
                                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                                        child: TextFormField(
                                          onChanged: (value) {
                                            setState(() {
                                              searchController.text = value;
                                            });
                                          },
                                          controller: searchController,
                                          style: textStyleAdvices,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color.fromRGBO(244, 244, 244, 1),
                                            suffixIcon: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: SvgPicture.asset('assets/icons/search.svg'),
                                            ),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(6)),
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
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                      height: 40,
                                      child: ListView.builder(
                                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: recipesCategory.length - 1,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              setState(() {
                                                recipesCategory.forEach((element) {
                                                  element.isSelect = false;
                                                });
                                                recipesCategory[index + 1].isSelect = true;
                                                changeCategory(recipesCategory[index + 1].id ?? 0);
                                              });
                                            },
                                            child: recipesCategory[index + 1].build(context),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.sizeOf(context).height / 5,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: filtred.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Container(
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
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                                                  child: Row(
                                                    children: [
                                                      CustomButton(
                                                        width: 24,
                                                        height: 24,
                                                        child: SvgPicture.asset(
                                                          filtred[index].favourites
                                                              ? 'assets/icons/mark_app.svg'
                                                              : 'assets/icons/active/mark_app_active.svg',
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
                                                          child: Text(filtred[index].name),
                                                        ),
                                                      ),
                                                      CustomButton(
                                                        width: 24,
                                                        height: 24,
                                                        child: SvgPicture.asset(
                                                          filtred[index].isSelect
                                                              ? 'assets/icons/active/checkbox_active.svg'
                                                              : 'assets/icons/checkbox.svg',
                                                          fit: BoxFit.fill,
                                                          colorFilter: ColorFilter.mode(
                                                            greenColor,
                                                            BlendMode.srcIn,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            filtred[index].isSelect = !filtred[index].isSelect;
                                                            filtred[index].isSelect == true
                                                                ? widget.recipes?.add(filtred[index])
                                                                : widget.recipes?.removeAt(index);
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 12, bottom: 10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        filtred[index].tags,
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontFamily: 'Mosterrat',
                                                          fontWeight: FontWeight.w300,
                                                          color: greenColor,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Row(
                      children: [
                        Text(
                          'Выберите рецепт',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: greenColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/add_ingredients.svg',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
