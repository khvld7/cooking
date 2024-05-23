import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuDetails extends StatelessWidget {
  List<DayMenuDB> days;

  MenuDetails({required this.days, super.key});

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
                'Планирование меню',
                style: textStyleViewsAppBar,
              ),
            ),
          ],
        ),
      ),
      body: days.length == 1
          ? ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/calendar.svg'),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                          Text(
                            days.length == 1 ? days.first.date ?? '' : '${days.first.date ?? ''} - ${days.last.date ?? ''}',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Source_Sans',
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                      Divider(
                        height: 1,
                        color: greenColor,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 0, bottom: 60),
                        physics: BouncingScrollPhysics(),
                        itemCount: days.length,
                        itemBuilder: (BuildContext context, int index) {
                          final recepIndex = days.elementAt(index);
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
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
                              alignment: AlignmentDirectional(0.9, 0),
                              children: [
                                CustomButton(
                                  borderRadius: BorderRadius.circular(6),
                                  height: 30,
                                  color: greenColor,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        recipesCategory[recepIndex.recipes?[index].category ?? 0].image!,
                                        width: 20,
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 5),
                                      ),
                                      Text(
                                        recipesCategory[recepIndex.recipes?[index].category ?? 0].text,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Source_Sans',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 5),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            recepIndex.recipes![index].favourites
                                                ? 'assets/icons/mark_app.svg'
                                                : 'assets/icons/active/mark_app_active.svg',
                                            fit: BoxFit.fill,
                                            colorFilter: ColorFilter.mode(
                                              recepIndex.recipes?[index].favourites ?? false ? greenColor : Colors.grey,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 12),
                                              child: Text(recepIndex.recipes?[index].name ?? ''),
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
                                              days[index].recipes?[index].tags ?? '',
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
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          : ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 0, bottom: 60),
              physics: BouncingScrollPhysics(),
              itemCount: days.length,
              itemBuilder: (BuildContext context, int index) {
                final recepIndex = days.elementAt(index);
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/calendar.svg'),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                          Text(
                            days[index].date!,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Source_Sans',
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                      Divider(
                        height: 1,
                        color: greenColor,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: recepIndex.recipes?.length,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(bottom: 0),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
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
                                alignment: AlignmentDirectional(0.9, 0),
                                children: [
                                  CustomButton(
                                    borderRadius: BorderRadius.circular(6),
                                    height: 30,
                                    color: greenColor,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          recipesCategory[recepIndex.recipes?[index].category ?? 0].image!,
                                          width: 20,
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 5),
                                        ),
                                        Text(
                                          recipesCategory[recepIndex.recipes?[index].category ?? 0].text,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Source_Sans',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 5),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              recepIndex.recipes?[index].favourites ?? false
                                                  ? 'assets/icons/mark_app.svg'
                                                  : 'assets/icons/active/mark_app_active.svg',
                                              fit: BoxFit.fill,
                                              colorFilter: ColorFilter.mode(
                                                recepIndex.recipes?[index].favourites ?? false ? greenColor : Colors.grey,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 12),
                                                child: Text(recepIndex.recipes![index].name),
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
                                                recepIndex.recipes?[index].tags ?? '',
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
                            );
                          }),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
