import 'package:cooking/components/count_button.dart';
import 'package:cooking/components/custom_textfield.dart';
import 'package:cooking/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IngredientsCustom extends StatefulWidget {
  int? id;
  int? count;
  String? gramm;
  TextEditingController? controller;

  IngredientsCustom({
    this.controller,
    this.gramm = 'г.',
    this.count = 0,
    this.id = 1,
    super.key,
  });

  @override
  State<IngredientsCustom> createState() => _IngredientsCustomState();
}

class _IngredientsCustomState extends State<IngredientsCustom> {
  int count = 0;
  String dropDownValue = items.first;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          CustomTextfield(
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
            hintText: 'Название',
            onChanged: (value) {
              value = widget.controller?.text ?? '';
            },
            controller: widget.controller,
            textCapitalization: TextCapitalization.sentences,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CountButton(
                count: count,
                onPlus: () => setState(() {
                  if (dropDownValue.contains('шт.') || dropDownValue.contains('ст.л.') || dropDownValue.contains('ч.л.')) {
                    count += 1;
                    widget.count = count;
                  } else {
                    count += 50;
                    widget.count = count;
                  }
                }),
                onMinus: () => setState(() {
                  if (count != 0) {
                    if (dropDownValue.contains('шт.') || dropDownValue.contains('ст.л.') || dropDownValue.contains('ч.л.')) {
                      count -= 1;
                      widget.count = count;
                    } else {
                      count -= 50;
                      widget.count = count;
                    }
                  }
                }),
              ),
              Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(226, 243, 216, 1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Theme(
                  data: ThemeData(
                    canvasColor: Color.fromRGBO(226, 243, 216, 1),
                  ),
                  child: DropdownButton<String>(
                    underline: SizedBox.shrink(),
                    items: items.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem(
                          onTap: () => count = 0,
                          child: Text(value),
                          value: value,
                        );
                      },
                    ).toList(),
                    value: dropDownValue,
                    onChanged: (value) => setState(() {
                      dropDownValue = value!;
                      widget.gramm = dropDownValue;
                    }),
                    iconSize: 24,
                    icon: SvgPicture.asset('assets/icons/down_button.svg'),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
