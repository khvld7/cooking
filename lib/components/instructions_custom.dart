import 'package:cooking/components/custom_textfield.dart';
import 'package:cooking/components/style.dart';
import 'package:flutter/material.dart';

class InstructionsCustom extends StatefulWidget {
  int? id;
  TextEditingController? controller;
  InstructionsCustom({this.controller, this.id = 1, super.key});

  @override
  State<InstructionsCustom> createState() => _InstructionsCustomState();
}

class _InstructionsCustomState extends State<InstructionsCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      child: Container(
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
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Row(
                children: [
                  Text(
                    '${widget.id}. ',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: greenColor),
                  ),
                ],
              ),
            ),
            CustomTextfield(
              maxLines: null,
              hintText: 'Описание действия',
              prefixStyle: TextStyle(
                  color: greenColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Source_Sans'),
              onChanged: (value) {
                value = widget.controller?.text ?? '';
              },
              controller: widget.controller,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
    );
  }
}
