import 'package:cooking/adapter/hive_adapter.dart';
import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InstructionsDetails extends StatelessWidget {
  int? id;
  String? name;
  List<InstructionsDB>? instructionsDB;

  InstructionsDetails({this.name, this.id, this.instructionsDB, super.key});

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
                '${name!}, инструкция',
                style: textStyleViewsAppBar,
              ),
            ),
          ],
        ),
      ),
      body: instructionsDB!.length != 0
          ? ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              children: [
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
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: instructionsDB!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  '${instructionsDB![index].id}. ',
                                  style: textstyleHeader,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    '${instructionsDB![index].name}',
                                    style: TextStyle(
                                      color: Color.fromRGBO(64, 89, 89, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Source_Sans',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          borderRadius: BorderRadius.circular(6),
                          onPressed: () => Navigator.pop(context),
                          child: Text('Показать информацию'),
                          textColor: Colors.white,
                          color: greenColor,
                          isActive: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Text('Инструкция пуста'),
            ),
    );
  }
}
