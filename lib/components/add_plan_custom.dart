import 'package:cooking/components/calendar_custom.dart';
import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/custom_textfield.dart';
import 'package:cooking/components/style.dart';
import 'package:cooking/screens/views/add_purchases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPlanCustom extends StatefulWidget {
  int? id;
  TextEditingController? controller;

  AddPlanCustom({this.controller, this.id = 1, super.key});

  @override
  State<AddPlanCustom> createState() => _AddPlanCustomState();
}

class _AddPlanCustomState extends State<AddPlanCustom> {
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
                    'День ${widget.id}',
                    style: TextStyle(
                      color: greenColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Source_Sans',
                    ),
                  ),
                ),
                Text(
                  '$dateText',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Source_Sans',
                      color: Color.fromRGBO(64, 89, 89, 1)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: CustomButton(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset('assets/icons/calendar.svg'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                  ),
                                  Expanded(
                                    child: CustomButton(
                                      height: 35,
                                      textColor: Colors.white,
                                      color: greenColor,
                                      borderRadius: BorderRadius.circular(6),
                                      child: Text('Выбрать'),
                                      onPressed: () {
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                    ),
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
            children: [
              Expanded(
                child: Container(
                  child: CustomTextfield(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 15, left: 20),
                      child: Text(
                        '${widget.id!}. ',
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
                    controller: widget.controller,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
              ),
              CustomButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'Выберите рецепт',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: greenColor,
                          decoration: TextDecoration.underline),
                    ),
                    SvgPicture.asset(
                      'assets/icons/add_ingredients.svg',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
