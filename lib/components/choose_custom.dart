import 'package:cooking/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseCustom extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color? borderColor;
  final int? id;

  ChooseCustom({
    this.text,
    this.id,
    this.color,
    this.borderColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(top: 5, left: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(offset: Offset(1, 2), color: color!),
        ],
        borderRadius: BorderRadius.circular(6),
        color: borderColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                text!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Source_Sans',
                  color: Color.fromRGBO(64, 89, 89, 1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
            ),
            CustomButton(
              width: 16,
              height: 16,
              child: SvgPicture.asset('assets/icons/delete_tags.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
