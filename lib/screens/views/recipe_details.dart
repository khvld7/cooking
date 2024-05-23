import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/screens/views/instructions_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/count_button.dart';

class RecipeDetails extends StatelessWidget {
  String? name;
  int? person;
  String? about;
  int? marks;
  List<IngredientsDB>? ingredientsDB;
  List<InstructionsDB>? instructionsDB;
  String? note;

  RecipeDetails({
    this.name,
    this.person,
    this.about,
    this.marks,
    this.ingredientsDB,
    this.instructionsDB,
    this.note,
    super.key,
  });

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
                name!,
                style: textStyleViewsAppBar,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            'Количество персон',
                            style: textstyleHeader,
                          ),
                        ),
                      ),
                      CountButton(count: person),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Описание',
                        style: textstyleHeader,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        about!,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Source_Sans',
                          letterSpacing: 0.8,
                          color: Color.fromRGBO(64, 89, 89, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RatingBar.builder(
                        glow: false,
                        itemSize: 24,
                        itemBuilder: (context, index) => SvgPicture.asset(
                          'assets/icons/marks.svg',
                          colorFilter: ColorFilter.mode(Colors.yellow, BlendMode.srcIn),
                        ),
                        initialRating: marks!.toDouble(),
                        ignoreGestures: true,
                        onRatingUpdate: (value) {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Divider(
                    height: 1,
                    color: greenColor,
                  ),
                ),
                Row(
                  children: [
                    Text('Ингредиенты', style: textstyleHeader),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemExtent: 30,
                        itemCount: ingredientsDB?.length,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Text(
                                  '${ingredientsDB![index].id}. ',
                                  style: textstyleHeader,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      '${ingredientsDB![index].name}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Source_Sans',
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  '${ingredientsDB![index].count} ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Soucre_Sans',
                                    color: Color.fromRGBO(98, 132, 132, 1),
                                  ),
                                ),
                                Text(
                                  '${ingredientsDB![index].gramm}',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Soucre_Sans',
                                    color: Color.fromRGBO(98, 132, 132, 1),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Divider(
                    height: 1,
                    color: greenColor,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Заметки',
                        style: textstyleHeader,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 10, top: 7.5),
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                    ),
                    Expanded(
                      child: Text(
                        note!,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Source_Sans',
                          letterSpacing: 0.8,
                          color: Color.fromRGBO(64, 89, 89, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    borderRadius: BorderRadius.circular(6),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InstructionsDetails(name: name, instructionsDB: instructionsDB),
                      ),
                    ),
                    child: Text('Показать инструкцию'),
                    textColor: Colors.white,
                    color: greenColor,
                    isActive: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
