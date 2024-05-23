import 'package:cooking/components/custom_button.dart';
import 'package:cooking/components/style.dart';
import 'package:flutter/material.dart';

class CategoryCustom extends StatelessWidget {
  final int? id;
  final String? image;
  final String text;
  bool? isSelect;

  CategoryCustom({
    this.image,
    required this.text,
    this.isSelect = false,
    this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: CustomButton(
        borderRadius: BorderRadius.circular(6),
        height: 36,
        isActive: true,
        textColor: isSelect! ? Colors.white : greenColor,
        border: Border.all(color: greenColor),
        color: isSelect! ? greenColor : Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              image != null
                  ? Image.asset(
                      image!,
                      height: 25,
                      fit: BoxFit.fill,
                    )
                  : SizedBox.shrink(),
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
      ),
    );
  }
}
