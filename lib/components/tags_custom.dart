import 'package:cooking/components/custom_button.dart';
import 'package:cooking/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TagsCustom extends StatefulWidget {
  final String? text;
  final int? id;

  TagsCustom({this.text, this.id, super.key});

  @override
  State<TagsCustom> createState() => _TagsCustomState();
}

class _TagsCustomState extends State<TagsCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: EdgeInsets.only(top: 5, left: 5),
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Text(
              widget.text!,
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Source_Sans',
                  color: Color.fromRGBO(64, 89, 89, 1)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
            ),
            CustomButton(
              width: 16,
              height: 16,
              onPressed: () {
                setState(() {
                  tags.removeAt(tags.length);
                });
              },
              child: SvgPicture.asset('assets/icons/delete_tags.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
