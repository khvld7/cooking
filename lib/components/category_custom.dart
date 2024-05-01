import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/style.dart';
import 'package:flutter/material.dart';

class CategoryCustom extends StatelessWidget {
  final String image;
  final String text;
  bool? isSelect;

  CategoryCustom({
    required this.image,
    this.isSelect = false,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: CustomButton(
        height: 36,
        width: 88,
        isActive: true,
        textColor: isSelect! ? Colors.white : greenColor,
        border: Border.all(color: greenColor),
        color: isSelect! ? greenColor : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              height: 25,
              image,
              fit: BoxFit.fill,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
            Text(
              text,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                fontFamily: 'Souce_Sans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
